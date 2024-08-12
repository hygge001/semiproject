document.addEventListener('DOMContentLoaded', function() {
	
    // 파일명 확인
    document.getElementById('file-upload').addEventListener('change', function() {
        const fileInput = this;
        const fileNameSpan = document.getElementById('file-upload-filename');
        
        if (fileInput.files.length > 0) {
            const fileNames = Array.from(fileInput.files).map(file => file.name).join(', ');
            fileNameSpan.textContent = fileNames;
        } else {
            fileNameSpan.textContent = 'No files selected';
        }
    });

    // form action 2개
    document.getElementById("post").addEventListener("submit", function(event) {
        event.preventDefault();

        // 첫 번째 URL로 데이터 전송
        fetch('communityboardwrite', {
            method: 'POST',
            body: new FormData(document.getElementById('post'))
        })

        // 두 번째 URL로 데이터 전송
        fetch('upload', {
            method: 'POST',
            enctype: 'multipart/form-data',
            body: new FormData(document.getElementById('post'))
        })
    });
});
