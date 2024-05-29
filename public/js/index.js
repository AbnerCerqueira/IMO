const carousel = document.querySelector('.carousel');
const prevBtn = document.querySelector('.prev');
const nextBtn = document.querySelector('.next');
const totalItems = document.querySelectorAll('.carousel-item').length;
const visibleItems = 5;
const itemWidth = 220 + 20; // width + margin
let position = 0;

nextBtn.addEventListener('click', () => {
    if (position > -((totalItems - visibleItems) * itemWidth)) {
        position -= itemWidth;
    } else {
        position = 0;
    }
    carousel.style.transform = `translateX(${position}px)`;
});

prevBtn.addEventListener('click', () => {
    if (position < 0) {
        position += itemWidth;
    } else {
        position = -((totalItems - visibleItems) * itemWidth);
    }
    carousel.style.transform = `translateX(${position}px)`;
});
