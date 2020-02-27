<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Upload File Request Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

	<form method="POST" action="uploadFile" enctype="multipart/form-data">
		File to upload: <input type="file" name="file" id="file"><br /> 
		Name: <input type="text" name="name" id="docName"  size="50" readOnly disabled required><br /> <br /> 
		 <input type="hidden" name="name">
		Size: <input type="text" name="docSize" id="docSize"  size="25" readOnly disabled required><br /> <br />
		<input type="submit" value="Upload"> Press here to upload the file!
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	//var fileName = $('#fileName').val().toLowerCase();
	/* if(fileName.indexOf('.pdf') != fileName.length - 4) {
		 alert("please upload pdf file only");
		 $('#fileName').val('');
	} */
	$(document).ready(function() {
	    /* $('#file').change(function(evt) {
	        
			var fileName = $(this).val().toLowerCase();
	        console.log(fileName);
	        if(fileName.indexOf('.pdf') == fileName.length - 4) {
	        console.log('file name matched - PDF Format');
	        //var mySubString = fileName.substring(fileName.lastIndexOf("\") + 1,fileName.lastIndexOf("."));
	        //var mySubString = fileName.split('\').pop().split('.')[0];
	        $('#docName').val('SignedDocument_'+evt.target.files[0].name);
	        $('#docSize').val(evt.target.files[0].size + "bytes"); 
	        
	        }else{
	        	console.log('alert - file is not a PDF');
	        }
	        
	    }); */
		$('input[type="file"]').change(function(event) {
			var _name = this.files[0].name;
			if(_name.indexOf('.pdf') == _name.length -4)
			{	console.log('PDF file selected');
				$('#docName').val('SignedDocument_'+this.files[0].name);

	        	 
	         	var _size = this.files[0].size;
	        	var fSExt = new Array('Bytes', 'KB', 'MB', 'GB'),
	        	i=0;while(_size>900){_size/=1024;i++;}
	        	var exactSize = (Math.round(_size*100)/100)+' '+fSExt[i];
	        	 $('#docSize').val(exactSize);
		
	        	 const size =  (this.files[0].size / 1024 / 1024).toFixed(2);
	        	 if (size > 4) { 
	                 alert("File must be less than size of 4 MB"); 
	             } else { 
	            	 $('#docSize').val(size+" MB"); 
	             } 
	        	 
			}
	    });
	});	
</script>
</html>