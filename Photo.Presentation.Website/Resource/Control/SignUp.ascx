<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignUp.ascx.cs" Inherits="Resource.Control.SignUp" %>

<div class="modal fade" id="loginSignup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div id="signup-popup-free" class="lightbox has--session-form" style="left: 50%; margin-left: 115px; margin-top: 30px; z-index: 1002; top: 50%; display: block;">
                <a class="close" data-dismiss="modal" rel="close">close</a>
                <div class="main">
                    <form accept-charset="UTF-8" class="free-signup-form has-animated-input account-modal" data-remote="true" id="freesignupform" runat="server">
                        <div style="margin: 0; padding: 0; display: inline">
                            <input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="QDkjKl/1AbiTmOOLmPuD4gENIOZOof01G2L1wKOfpCU=">
                        </div>

                        <!-- step 1 -->
                        <h1 class="create-account">Create an Account
        <small>Already a member? <a href="#" data-target="login-popup" rel="lightbox" class="login-link">Log in →</a>
        </small>
                        </h1>

                        <div class="bad-cred-alert alert alert-warning" runat="server" id="divMessage" visible="False">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <asp:Literal ID="ltlMessage" EnableViewState="false" runat="server" />
                        </div>

                        <div class="facebook_register">
                            <div class="btn__fb-login" onclick="connected_to_facebook();"><span class="btn__fb-login-text">Connect with Facebook</span></div>
                        </div>


                        <div class="or-divider"><span>or</span></div>

                        <div class="row field-holder">
                            <label class="hidden" for="txtFirstName">First Name</label>
                            <input class="text animated-input txtFirstName" id="txtFirstName" name="txtFirstName" placeholder=" " size="30" type="text" autofocus="" runat="server" />
                            <label class="animated-lbl su-email" for="txtFirstName">First Name</label>
                            <div class="label-bg"></div>
                            <div class="field-error-description"></div>
                        </div>
                        <div class="row field-holder">
                            <label class="hidden" for="txtLastName">Last Name</label>
                            <input class="text animated-input" id="txtLastName" name="txtFirstName" placeholder=" " size="50" type="text" autofocus="" runat="server" />
                            <label class="animated-lbl su-email" for="txtLastName">Last Name</label>
                            <div class="label-bg"></div>
                            <div class="field-error-description"></div>
                        </div>
                        <div class="row field-holder">
                            <label class="hidden" for="txtUserName">User Name</label>
                            <input class="text animated-input" id="txtUserName" name="txtFirstName" placeholder=" " size="30" type="email" autofocus="" runat="server" />
                            <label class="animated-lbl su-email" for="txtUserName">User Name</label>
                            <div class="label-bg"></div>
                            <div class="field-error-description"></div>
                        </div>
                        <div class="row field-holder">
                            <label class="hidden" for="txtCKPassword">Choose a Password</label>
                            <input class="text animated-input" id="txtCKPassword" name="txtCKPassword" placeholder=" " size="30" type="password" autofocus="" runat="server" />
                            <label class="animated-lbl su-password" for="txtCKPassword">Choose a Password</label>
                            <div class="label-bg"></div>
                        </div>
                        <div class="row field-holder">
                            <label class="hidden" for="txtCKConfirmPassword">Confirm your Password</label>
                            <input class="text animated-input" id="txtCKConfirmPassword" name="txtCKConfirmPassword" placeholder=" " size="30" type="password" autofocus="" runat="server" />
                            <label class="animated-lbl su-confirm-password" for="txtCKConfirmPassword">Confirm your Password</label>
                            <div class="label-bg"></div>
                            <div class="field-error-description"></div>
                        </div>


                        <div class="row">
                            <asp:Button type="button" class="btn primary submit signupcontinuebtn" runat="server" ID="btnSignUp" OnClick="btnSignUp_Click" Text="Sign Up" OnClientClick="if (!validatePage()) {return false;}" />
                            <asp:HyperLink class="de-link read-terms-and-conditions-link" ID="HyperLink1" runat="server"
                                NavigateUrl="~/Login.aspx">Already having an account? 
                                        Sign In!</asp:HyperLink>
                        </div>

                        <small class="signup-tos">By creating an account, you agree to our<br>
                            <a href="/privacy" target="_blank">Privacy Policy</a> &amp; <a href="/terms" target="_blank">Terms of Use</a>
                        </small>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../Resource/Javascript/Pages/signup/signUp.js"></script>