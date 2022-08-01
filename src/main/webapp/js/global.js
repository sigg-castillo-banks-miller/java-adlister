(() => {
    barba.init({
        transitions: [{
            name: 'home',
            sync: true,
            beforeEnter: (data) => {
                window.scrollTo({
                    top: 0, left: 0
                });
                initCards();

                if (window.location.href.indexOf('/logout') !== -1) window.location.href = '/';
            },
            enter: async (data) => {
                return anime({
                    targets: data.next.container,
                    translateX: [1000, 0],
                    opacity: [0, 1],
                }).finished;

            },
            leave: async (data) => {
                return anime({
                    targets: data.current.container,
                    translateX: [0, -1000],
                    opacity: [1, 0],
                }).finished;
            }
        }]
    });


    const ThemeSwitcher = () => {
        //language=HTML
        const container = document.createElement('div');
        container.id = 'theme-switcher';
        container.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high-fill" viewBox="0 0 16 16">
                    <path d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                </svg>`;
        return container;
    };

    document.body.prepend(ThemeSwitcher());

    const themeSwitcher = document.getElementById('theme-switcher');
    let theme = localStorage.getItem('theme');
    if (theme === null) theme = 'dark';
    let themeCount = 0;

    const setTheme = (newTheme) => {
        document.body.classList.remove('dark', 'light', 'rainbow');
        document.body.classList.add(newTheme);
        localStorage.setItem('theme', newTheme);
        theme = newTheme;
    };

    setTheme(theme);

    themeSwitcher.addEventListener('click', () => {
        if (++themeCount % 10 === 0) {
            setTheme('rainbow');
        } else {
            setTheme(theme === 'dark' ? 'light' : 'dark');
        }
    });


    const initCards = () => {
        let cards = document.querySelectorAll('.ad-card');
        for (let card of cards) {

            card.addEventListener('click', function (e) {
                const id = card.getAttribute('data-id');
                console.log(e.target);
                if (e.target.classList.contains('clickable')) {
                    barba.go('/ads/ad-details?id=' + id);
                }
            });
        }
    };
    initCards();

})();


