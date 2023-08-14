// Store the original order of the rows
const originalRows = Array.from(document.querySelectorAll('#tableBody tr'));
originalRows.shift(); // Remove table header row

document.getElementById('sortSelect').addEventListener('change', function() {
    const sortSelect = document.getElementById('sortSelect');
    const tableBody = document.getElementById('tableBody');
    
    const rows = [...originalRows]; // Create a copy of the original rows array
    
    if (sortSelect.value === 'terbaru') {
        rows.sort((a, b) => {
            const dateA = new Date(a.cells[5].textContent);
            const dateB = new Date(b.cells[5].textContent);
            return dateB - dateA;
        });
    } else if (sortSelect.value === 'terlama') {
        rows.sort((a, b) => {
            const dateA = new Date(a.cells[5].textContent);
            const dateB = new Date(b.cells[5].textContent);
            return dateA - dateB;
        });
    }
    
    tableBody.innerHTML = ''; // Clear the table body
    
    rows.forEach((row, index) => {
        row.cells[0].textContent = index + 1; // Update the 'No' column
        tableBody.appendChild(row);
    });
});
