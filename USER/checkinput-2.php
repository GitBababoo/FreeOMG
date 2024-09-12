<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form with Bootstrap 5</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script type="text/javascript">
        function chkdata(form) {
            var txtError = "กรุณากรอก ";
            var showError = false;

            if (form.lstitle.value === "0") {
                showError = true;
                txtError += "คำนำหน้า ";
            }
            if (form.txtname.value.trim() === "") {
                showError = true;
                txtError += "ชื่อ ";
            }
            if (form.txtsurname.value.trim() === "") {
                showError = true;
                txtError += "นามสกุล ";
            }
            if (form.lsdept.value === "0") {
                showError = true;
                txtError += "สาขาวิชา ";
            }
            if (form.lsdegree.value === "0") {
                showError = true;
                txtError += "ระดับการศึกษา ";
            }
            if (showError) {
                alert(txtError);
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <div class="container mt-5">
        <form method="POST" action="<?php echo $editFormAction; ?>" name="frmpersonaledit" id="frmpersonaledit" onsubmit="return chkdata(this);">
            <div class="mb-3">
                <label for="lstitle" class="form-label">คำนำหน้า:</label>
                <select name="lstitle" id="lstitle" class="form-select">
                    <option value="0">-- กรุณาเลือก --</option>
                    <!-- เพิ่มตัวเลือกอื่นๆ ที่นี่ -->
                </select>
            </div>

            <div class="mb-3">
                <label for="txtname" class="form-label">ชื่อ:</label>
                <input type="text" class="form-control" name="txtname" id="txtname" maxlength="15" required>
            </div>

            <div class="mb-3">
                <label for="txtsurname" class="form-label">นามสกุล:</label>
                <input type="text" class="form-control" name="txtsurname" id="txtsurname">
            </div>

            <div class="mb-3">
                <label for="lsdept" class="form-label">สาขาวิชา:</label>
                <select name="lsdept" id="lsdept" class="form-select">
                    <option value="0">-- กรุณาเลือก --</option>
                    <!-- เพิ่มตัวเลือกอื่นๆ ที่นี่ -->
                </select>
            </div>

            <div class="mb-3">
                <label for="lsdegree" class="form-label">ระดับการศึกษา:</label>
                <select name="lsdegree" id="lsdegree" class="form-select">
                    <option value="0">-- กรุณาเลือก --</option>
                    <!-- เพิ่มตัวเลือกอื่นๆ ที่นี่ -->
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
