import { useState } from 'react';
import { Search, SlidersHorizontal, Link as LinkIcon, Download, Plus } from 'lucide-react';
import './orders-page.css';

// ЛОКАЛЬНЫЕ ДАННЫЕ — не трогаем data.js!
const localOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', shop: 'H&M', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', shop: 'Zara', sum: '5 200 ₽', status: 'На складе' },
  { id: '12347', date: '20.10.2022', track: 'UK111222333', shop: 'ASOS', sum: '34 100 ₽', status: 'Доставлен' },
  { id: '12348', date: '22.10.2022', track: 'UK222333444', shop: 'eBay', sum: '8 900 ₽', status: 'В пути' },
  { id: '12349', date: '25.10.2022', track: 'UK333444555', shop: 'Amazon', sum: '15 200 ₽', status: 'Обрабатывается' },
];

export default function OrdersPage() {
  const [activeTab, setActiveTab] = useState('all');
  const [isPayModalOpen, setIsPayModalOpen] = useState(false);
  const [isCreateMenuOpen, setIsCreateMenuOpen] = useState(false);
  const [selectedOrder, setSelectedOrder] = useState(null);

  const openPayModal = (order) => { setSelectedOrder(order); setIsPayModalOpen(true); };

  return (
    <div>
      <h2 className="title-h2 mb-4">Заказы пользователя Dmitro Karlov</h2>

      <div className="orders-tabs mb-4">
        <button className={activeTab === 'all' ? 'active' : ''} onClick={() => setActiveTab('all')}>Все</button>
        <button className={activeTab === 'mine' ? 'active' : ''} onClick={() => setActiveTab('mine')}>Мои заказы</button>
      </div>

      <div className="orders-filters mb-4">
        <div className="search-input">
          <input type="text" placeholder="Поиск по номеру, треку или магазину..." />
          <Search size={20} color="var(--text-muted)" />
        </div>
        <button className="btn btn-outline"><SlidersHorizontal size={16}/> Фильтры</button>
        
        <div className="create-order-wrapper">
          <button className="btn btn-primary" onClick={() => setIsCreateMenuOpen(!isCreateMenuOpen)}>
            <Plus size={16}/> Создать заказ
          </button>
          {isCreateMenuOpen && (
            <div className="create-menu">
              <a href="/orders/create-self">Самостоятельно</a>
              <a href="/orders/checkout">Через сервис</a>
            </div>
          )}
        </div>
      </div>

      <div className="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>Дата</th><th>ID Заказа</th><th>Трек-номер</th><th>Магазин</th><th>Сумма</th><th>Статус</th><th>Файлы</th><th>Действия</th>
            </tr>
          </thead>
          <tbody>
            {localOrders.map(o => (
              <tr key={o.id} className="order-row">
                <td>{o.date}</td>
                <td><b>#{o.id}</b></td>
                <td className="text-muted">{o.track}</td>
                <td>{o.shop}</td>
                <td><b>{o.sum}</b></td>
                <td><span className={`status-badge ${o.status === 'В пути' ? 'bg-yellow-100 text-yellow-700' : o.status === 'Доставлен' ? 'bg-green-100 text-green-700' : 'bg-blue-100 text-blue-700'}`}>{o.status}</span></td>
                <td className="actions-cell">
                  <button className="icon-btn" title="Ссылка"><LinkIcon size={16}/></button>
                  <button className="icon-btn" title="Скачать"><Download size={16}/></button>
                </td>
                <td>
                  <button onClick={() => openPayModal(o)} className="btn btn-outline" style={{padding: '8px 16px', fontSize: 13}}>Оплатить</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {isPayModalOpen && (
        <div className="modal-overlay" onClick={() => setIsPayModalOpen(false)}>
          <div className="modal-content" onClick={e => e.stopPropagation()}>
            <h3 className="text-xl font-bold mb-6">Выберите метод оплаты:</h3>
            <p className="text-muted mb-6">Заказ #{selectedOrder?.id} на сумму {selectedOrder?.sum}</p>
            <div className="pay-methods">
              <label className="pay-method">
                <input type="radio" name="pay" defaultChecked />
                <div className="pay-logo">
                  <img src="/images/icons/visa.png" alt="Visa" onError={(e)=>e.target.style.display='none'}/>
                </div>
                <div>
                  <b>VISA MASTERCARD</b>
                  <p className="text-xs text-muted">Комиссия сервиса 7% (минимум 2 USD/2 EUR)</p>
                </div>
              </label>
              <label className="pay-method">
                <input type="radio" name="pay" />
                <div className="pay-logo">
                  <img src="/images/icons/paypal.png" alt="PayPal" onError={(e)=>e.target.style.display='none'}/>
                </div>
                <div>
                  <b>PAYPAL</b>
                  <p className="text-xs text-muted">Комиссия сервиса 7% (минимум 2 USD/2 EUR)</p>
                </div>
              </label>
            </div>
            <div className="flex gap-3 mt-8">
              <button className="btn btn-primary flex-1" onClick={() => { setIsPayModalOpen(false); alert('Перенаправление на оплату...'); }}>Перейти к оплате</button>
              <button className="btn btn-outline" onClick={() => setIsPayModalOpen(false)}>Отмена</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
