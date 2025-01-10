document.addEventListener('DOMContentLoaded', () => {
    const addCardButtons = document.querySelectorAll('.add-card-btn');

    addCardButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            const taskList = e.target.parentElement;
            const newCard = document.createElement('div');
            newCard.className = 'card';
            newCard.textContent = prompt('Enter task title:');
            if (newCard.textContent.trim()) {
                taskList.insertBefore(newCard, e.target);
            }
        });
    });
});
