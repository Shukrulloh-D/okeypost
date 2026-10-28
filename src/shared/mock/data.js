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
   { id: 3, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва', img: '/images/reviews/3.png' }, { id: 4, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва', img: '/images/reviews/4.png' },
];
// 25 магазинов с путями к иконкам
export const mockStores = Array.from({ length: 25 }).map((_, i) => ({ id: i + 1, name: `Store ${i + 1}`, img: `/images/stores/store${i + 1}.png` }));

export const mockSales = [
  { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/1.png' },
  { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/2.png' },
  { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/3.png' },
  { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/4.png' },
  { id: 5, shop: 'Timberland', desc: 'Новая коллекция', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/5.png' },
  { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/6.png' },
  { id: 7, shop: 'Levi\'s', desc: 'Скидки 30% на джинсы', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/7.png' },
  { id: 8, shop: 'UGG', desc: 'Вход с VPN', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/8.png' },
  { id: 9, shop: 'New Balance', desc: 'Скидки 50%', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/9.png' },
  { id: 10, shop: 'Ayrner Saks OFF 5TH', desc: 'Black Friday', info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', img: '/images/sales/10.png' },
];
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
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой.' }, 
    { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS.' }, 
    { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно.' },
    { id: 4, q: 'Можно ли купить с частной предпринимателя?', a: 'Да, можно.' },
    { id: 5, q: 'Что такое обычный заказ?', a: 'Это стандартная процедура.' }
  ]},
  { category: 'Покупки в магазинах Англии, скидки и промокода', items: [
    { id: 6, q: 'Анонс скидочных купонов и промокодов', a: 'В нашем блоге.' }, 
    { id: 7, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете.' },
    { id: 8, q: 'Купил на Ebay, продавец не отправляет заказ, нужен скан返.', a: 'Обратитесь в поддержку.' },
    { id: 9, q: 'Сколько стоит удаление вешалок и коробок?', a: 'Бесплатно.' },
    { id: 10, q: 'Какой срок бесплатного хранения?', a: '70 дней.' }
  ]},
  { category: 'Доставка из Англии', items: [
    { id: 11, q: 'Как часто вы отправляете посылки?', a: 'Еженедельно.' },
    { id: 12, q: 'Возможно ли доставка в страны, не указанные на сайте?', a: 'Да, напишите в поддержку.' },
    { id: 13, q: 'Сколько стоит доставка в Казахстан и другие страны Азии?', a: 'Рассчитывается индивидуально.' },
  ]},
];
