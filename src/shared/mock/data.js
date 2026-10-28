export const mockCategories = [
  { id: 1, name: 'Одежда', img: '/images/icons/clothes.png' }, { id: 2, name: 'Электроника', img: '/images/icons/laptop.png' },
  { id: 3, name: 'Аксессуары', img: '/images/icons/bag.png' }, { id: 4, name: 'Для детей', img: '/images/icons/baby.png' },
  { id: 5, name: 'Для спорта', img: '/images/icons/sport.png' }, { id: 6, name: 'Косметика', img: '/images/icons/cosmetics.png' },
];
export const mockDeliveryOptions = [
  { id: 1, name: 'ПОЧТА РОССИИ', days: '10-14 дней', cost: 'от £27.00', total: '£41.99', img: '/images/icons/post.png' },
  { id: 2, name: 'EMS ПОЧТА РОССИИ', days: '9-12 дней', cost: 'от £40.00', total: '£54.55', img: '/images/icons/ems.png' },
  { id: 3, name: 'ПОЧТА РОССИИ МЕЛКИЕ ПАКЕТЫ', days: '10-14 дней', cost: 'от £13.00', total: '£30.50', img: '/images/icons/package.png' },
];
export const mockReviews = [
  { id: 1, name: 'NIKOLAY S', stars: 5, text: 'Ваша доставка самая быстрая и дешёвая!!!', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/1.png' },
  { id: 2, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва', img: '/images/reviews/2.png' },
  { id: 3, name: 'VLADIMIR E', stars: 5, text: 'Отзыв, как всегда! Отдельное спасибо за упаковку.', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/3.png' },
  { id: 4, name: 'Оксана', stars: 5, text: 'Очень быстро, надежно! Как всегда большое спасибо!', date: '16 Ноября 2021', city: 'Odintsovo', img: '/images/reviews/4.png' },
];

// 25 магазинов
export const mockStores = ['PRIMARK', 'H&M', 'MANGO', 'Next', 'Sports Direct', 'F&F', 'Accessorize', 'Adidas', 'Amazon', 'ASOS', 'Boohoo', 'Crocs', 'eBay', 'Matalan', 'Mothercare', 'New Look', 'Puma', 'Timberland', 'ZARA', 'Clarks', 'M&S', 'Tucci', 'Zulily', 'Panache', 'Betterware'];

// 10 распродаж
export const mockSales = [
  { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', img: '/images/sales/1.png' },
  { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', img: '/images/sales/2.png' },
  { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', img: '/images/sales/3.png' },
  { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', img: '/images/sales/4.png' },
  { id: 5, shop: 'Timberland', desc: 'Новая коллекция', img: '/images/sales/5.png' },
  { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', img: '/images/sales/6.png' },
  { id: 7, shop: 'Levi\'s', desc: 'Скидки 30% на джинсы', img: '/images/sales/7.png' },
  { id: 8, shop: 'UGG', desc: 'Вход с VPN', img: '/images/sales/8.png' },
  { id: 9, shop: 'New Balance', desc: 'Скидки 50%', img: '/images/sales/9.png' },
  { id: 10, shop: 'Ayrner Saks OFF 5TH', desc: 'Black Friday', img: '/images/sales/10.png' },
];

// 12 блогов
export const mockBlog = [
  { id: 1, title: 'Интернет-магазин Urban Outfitters в UK: обзор', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/1.png' },
  { id: 2, title: 'Overstock. Брендовые товары по доступным ценам', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/2.png' },
  { id: 3, title: 'Sneakers и Amazon. Удобная обувь для всей семьи', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/3.png' },
  { id: 4, title: '16 лучших подарков с Amazon в 2021 году', date: '22.10.2021', cat: 'Разное', img: '/images/blog/4.png' },
  { id: 5, title: 'Target — семейный супермаркет с ценами от 300 рублей', date: '22.10.2021', cat: 'Разное', img: '/images/blog/5.png' },
  { id: 6, title: 'Английский магазин RIPDIR. Покупаем с выгодой', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/6.png' },
  { id: 7, title: 'Na-kd. Женские тренды из Англии по низким ценам', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/7.png' },
  { id: 8, title: 'Farfetch 21 - лучшие цены на 1500 рублей', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/8.png' },
  { id: 9, title: 'Как купить кроссовки Balenciaga на 30 000 дешевле?', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/9.png' },
  { id: 10, title: 'Tom Ford. Самые дорогие сумки Louis Vuitton', date: '22.10.2021', cat: 'Разное', img: '/images/blog/10.png' },
  { id: 11, title: 'BH Cosmetics Galaxy. Косметика красоты и ухода', date: '22.10.2021', cat: 'Разное', img: '/images/blog/11.png' },
  { id: 12, title: '"Васюки". Крутые кеды, которые не выйдут из моды никогда!', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/12.png' },
];

export const mockOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
];

export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам...' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11...' },
];

export const mockFaq = [
  { category: 'Виртуальный адрес в Великобритании', items: [ { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' }, { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' }, { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно.' } ]},
  { category: 'Покупки в магазинах Англии', items: [ { id: 4, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' }, { id: 5, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете.' } ]},
];
