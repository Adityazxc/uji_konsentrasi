
document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById("searchInput");
    const tableBody = document.getElementById("tableBody");

    // Tambahkan event listener untuk perubahan input pencarian
    searchInput.addEventListener("input", function() {
        const searchTerm = searchInput.value.toLowerCase();

        // Ambil semua baris data dari tabel
        const rows = tableBody.querySelectorAll("tr");

        // Loop melalui baris dan sembunyikan yang tidak sesuai dengan kriteria pencarian
        rows.forEach(function(row) {
            const nipCell = row.cells[0].textContent.toLowerCase();
            const namaCell = row.cells[1].textContent.toLowerCase();
            const departemenCell = row.cells[2].textContent.toLowerCase();

            // Tampilkan atau sembunyikan baris berdasarkan kriteria pencarian
            if (
                nipCell.includes(searchTerm) ||
                namaCell.includes(searchTerm) ||
                departemenCell.includes(searchTerm)
            ) {
                row.style.display = "table-row"; // Tampilkan baris
            } else {
                row.style.display = "none"; // Sembunyikan baris
            }
        });
    });
});