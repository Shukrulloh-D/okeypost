#!/bin/bash
echo "🛠️ Восстанавливаем ВСЕ моковые данные..."

cat > src/shared/mock/data.js << 'END'
// --- ДАННЫЕ ДЛЯ ГЛАВНОЙ И ЦЕН ---
export const mockCategories = [
  { id: 1, name: 'Одежда', icon: 'Shirt' },
  { id: 2, name: 'Электроника', icon: 'Laptop' },
  { id: 3, name: 'Аксессуары', icon: 'ShoppingBag' },
  { id: 4, name: 'Для детей', icon: 'Baby' },
  { id: 5, name: 'Для спорта', icon: 'Dumbbell' },
  { id: 6, name: 'Косметика', icon: 'Sparkles' },
];

export const mockDeliveryOptions = [
  { id: 1, name: 'ПОЧТА РОССИИ', days: '10-14 дней', cost: 'от £27.00', total: '£41.99', icon: 'Building2' },
  { id: 2, name: 'EMS ПОЧТА РОССИИ', days: '9-12 дней', cost: 'от £40.00', total: '£54.55', icon: 'Plane' },
  { id: 3, name: 'ПОЧТА РОССИИ МЕЛКИЕ ПАКЕТЫ', days: '10-14 дней', cost: 'от £13.00', total: '£30.50', icon: 'Package' },
];

export const mockReviews = [
  { id: 1, name: 'NIKOLAY S', stars: 5, text: 'Ваша доставка самая быстрая и дешёвая!!!', date: '16 Ноября 2021', city: 'Санкт-Петербург' },
  { id: 2, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва' },
  { id: 3, name: 'VLADIMIR E', stars: 5, text: 'Отзыв, как всегда! Отдельное спасибо за упаковку, часики от Apple пришли в целости.', date: '16 Ноября 2021', city: 'Санкт-Петербург' },
  { id: 4, name: 'Оксана', stars: 5, text: 'Очень быстро, надежно! Как всегда большое спасибо за работу!', date: '16 Ноября 2021', city: 'Odintsovo' },
];

export const mockStores = [
  { id: 1, name: 'PRIMARK', logo: '/images/store1.png' },
  { id: 2, name: 'H&M', logo: '/images/store2.png' },
  { id: 3, name: 'MANGO', logo: '/images/store3.png' },
  { id: 4, name: 'ZARA', logo: '/images/store4.png' },
  { id: 5, name: 'ASOS', logo: '/images/store5.png' },
  { id: 6, name: 'eBay', logo: '/images/store6.png' },
];

// --- ДАННЫЕ ДЛЯ FAQ ---
export const mockFaqData = [
  { category: 'Виртуальный адрес в Великобритании', items: [
    { id: 1, q: 'Что делать, если вы забыли внести трек-номер?', a: 'Свяжитесь с поддержкой, мы добавим его вручную.' },
    { id: 2, q: 'Как я узнаю, что заказ пришел на склад?', a: 'Вам придет SMS-уведомление и письмо на почту.' },
    { id: 3, q: 'Сколько стоит виртуальный адрес?', a: 'Бесплатно при регистрации.' },
  ]},
  { category: 'Покупки в магазинах Англии', items: [
    { id: 4, q: 'Анонс скидочных купонов и промокодов', a: 'Мы публикуем их в нашем блоге каждую неделю.' },
    { id: 5, q: 'Как узнать пришел ли заказ полностью?', a: 'В личном кабинете статус изменится на "На складе".' },
  ]},
  { category: 'Доставка из Англии', items: [
    { id: 6, q: 'Как часто вы отправляете посылки в Россию?', a: 'Еженедельно, по мере комплектации.' },
    { id: 7, q: 'Возможно ли доставка в страны, не указанные на сайте?', a: 'Да, напишите в поддержку для расчета.' },
  ]}
];

// --- ДАННЫЕ ДЛЯ ПРОФИЛЯ (ЗАКАЗЫ И УВЕДОМЛЕНИЯ) ---
export const mockOrders = [
  { id: '501', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '502', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
  { id: '503', date: '20.10.2022', track: 'UK111222333', sum: '34 100 ₽', status: 'Доставлен' },
];

export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам, что 25 ноября наш склад не работает.' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11 вы можете выкупить посылку бесплатно.' },
];
END

echo "✅ Данные восстановлены!"
