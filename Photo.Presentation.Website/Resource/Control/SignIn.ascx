<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignIn.ascx.cs" Inherits="Resource.Control.SignIn" %>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div id="login-popup" class="lightbox has--session-form" style="margin-left: 110px; z-index: 1002; margin-top: 74px; top: 50%; display: block;">
                <a class="close" data-dismiss="modal" rel="close">close</a>

                <div class="main">
                    <h1>Login to PhotoBook</h1>

                    <div class="facebook_register">
                        <div class="btn__fb-login" onclick="connected_to_facebook" runat="server"><span class="btn__fb-login-text">Connect with Facebook</span></div>
                    </div>

                    <div class="or-divider"><span>or</span></div>

                    <form class="account-form" data-remote="true" id="new_eezyauth_user_auth_session" role="form" runat="server">
                        <div class="bad-cred-alert alert alert-warning" runat="server" id="divMessage" visible="false">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <asp:Literal ID="ltlMessage" EnableViewState="false" runat="server" />
                        </div>

                        <div class="row">
                            <input class="text animated-input txtEmailAddress" id="txtEmailAddress" name="username" placeholder=" " size="30" type="text" autofocus="" runat="server" />
                            <label class="animated-lbl username" for="txtEmailAddress">Username/Email Address</label>
                            <div class="label-bg"></div>
                        </div>
                        <div class="row ">
                            <input class="text smaller animated-input txtCKPassword" id="txtCKPassword" name="password" value="" placeholder=" " size="30" type="password" runat="server" />
                            <label class="animated-lbl password" for="txtCKPassword">Password</label>
                            <div class="label-bg"></div>
                        </div>
                        <div class="row">
                            <label class="with-checkbox">
                                <input name="eezyauth_user_auth_session[remember_me]" type="hidden" value="1">
                                <input id="chkRememberMe" name="Field" value="remember" type="checkbox" runat="server" />
                                Keep me logged in
                            </label>
                        </div>
                        <div class="row ">
                            <asp:Button type="button" class="btn primary submit btn-login" runat="server" ClientIDMode="Static"
                                OnClientClick="if (!validatePage()) {return false;}"
                                ID="btnSignIn" OnClick="btnSignIn_Click" Text="Sign In" />
                        </div>
                        <div class="row ">
                            <div rel="close">
                                <a href="#" class="reset-password-link" data-target="loginForgotPassword" rel="lightbox">Forgot your password?</a>
                            </div>

                            <asp:HyperLink class="de-link read-terms-and-conditions-link" ID="CreateUserLink" runat="server"
                                NavigateUrl="~/SignUp.aspx">Create an account!</asp:HyperLink>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="../Resource/Javascript/Pages/login/singIn.js"></script>


