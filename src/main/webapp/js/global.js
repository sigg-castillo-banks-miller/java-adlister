(() => {
    barba.init({
        transitions: [{
            name: 'home',
            sync: true,
            enter: (data) => {
                return anime({
                    targets: data.next.container,
                    translateX: [1000, 0],
                    opacity: [0, 1],
                }).finished;

            },
            leave: (data) => {
                return anime({
                    targets: data.current.container,
                    translateX: [0, -1000],
                    opacity: [1, 0],
                }).finished;
            }
        }]
    });
})();