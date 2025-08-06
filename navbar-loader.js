// Navbar Loader - Загружает навигацию из navbar.html
function loadNavbar() {
    fetch('navbar.html')
        .then(response => response.text())
        .then(data => {
            // Создаем контейнер для навигации если его нет
            let navContainer = document.getElementById('navbar-container');
            if (!navContainer) {
                navContainer = document.createElement('div');
                navContainer.id = 'navbar-container';
                document.body.insertBefore(navContainer, document.body.firstChild);
            }
            
            // Вставляем навигацию
            navContainer.innerHTML = data;
            
            // Выполняем скрипты из загруженной навигации
            const scripts = navContainer.querySelectorAll('script');
            scripts.forEach(script => {
                const newScript = document.createElement('script');
                newScript.textContent = script.textContent;
                document.head.appendChild(newScript);
                script.remove();
            });
            
            // Добавляем стили
            const styles = navContainer.querySelectorAll('style');
            styles.forEach(style => {
                document.head.appendChild(style);
            });
        })
        .catch(error => {
            console.error('Ошибка загрузки навигации:', error);
        });
}

// Автоматически загружаем навигацию при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    loadNavbar();
});