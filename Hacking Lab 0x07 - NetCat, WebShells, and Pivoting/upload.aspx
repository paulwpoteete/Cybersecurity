<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>File Upload</title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <asp:Label ID="lblMessage" runat="server" Visible="false" EnableViewState="false"></asp:Label>
            <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" EnableViewState="false"></asp:Label>
            <br />
            <center>
                <p><strong>Upload Here</strong></p>
                <hr />
                <label for="fileUpload">Choose a file:</label>
                <input type="file" id="fileUpload" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            </center>
        </div>
    </form>

    <script runat="server">
        protected HtmlInputFile fileUpload;
        protected Button btnUpload;
        protected Label lblMessage;
        protected Label lblError;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No initialization needed on load for this simple form
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.PostedFile != null && fileUpload.PostedFile.ContentLength > 0)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string targetPath = Server.MapPath(".") + "\\" + fileName;

                try
                {
                    fileUpload.PostedFile.SaveAs(targetPath);
                    lblMessage.Text = "<center><h2>File Uploaded Successfully: " + fileName + "</h2><hr></center>";
                    lblMessage.Visible = true;
                    lblError.Visible = false;
                }
                catch
                {
                    lblError.Text = "There was some error. Maybe permissions?";
                    lblError.Visible = true;
                    lblMessage.Visible = false;
                }
            }
            else
            {
                lblError.Text = "No file selected or invalid upload.";
                lblError.Visible = true;
                lblMessage.Visible = false;
            }
        }
    </script>
</body>
</html>
