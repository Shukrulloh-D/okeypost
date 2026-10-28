import { useState } from 'react';
import { Search, SlidersHorizontal, Link as LinkIcon, Download, Plus } from 'lucide-react';
import { mockOrders, mockShipments, mockTransactions } from '@/shared/mock/data';
import { Button } from '@/shared/ui/button';
import { useToastStore } from '@/shared/ui/toast';
import './orders-page.css';

export default function OrdersPage() {
  const [activeTab, setActiveTab] = useState('all');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedOrder, setSelectedOrder] = useState(null);
  const addToast = useToastStore((s) => s.addToast);

  const openPayModal = (order) => { setSelectedOrder(order); setIsModalOpen(true); };
  const confirmPay = () => {
    addToast(`Заказ #${selectedOrder.id} оплачен!`, 'success');
    setIsModalOpen(false);
  };

  return (
    <div>
      <h2 className="title-h2 mb-4">Заказы пользователя Dmitro Karlov</h2>
      
      <div className="tabs mb-4">
        <button className={activeTab === 'all' ? 'active' : ''} onClick={() => setActiveTab('all')}>Все</button>
        <button className={activeTab === 'mine' ? 'active' : ''} onClick={() => setActiveTab('mine')}>Мои заказы</button>
      </div>

      <div className="flex gap-4 mb-6">
        <div className="flex items-center bg-white border rounded-lg px-4 py-2 flex-1" style={{borderColor: 'var(--border)'}}>
          <input type="text" placeholder="Поиск по номеру..." className="outline-none flex-1 text-sm" style={{border: 'none'}} />
          <Search size={18} className="text-gray-400"/>
        </div>
        <button className="btn btn-outline"><SlidersHorizontal size={16}/> Фильтры</button>
        <button className="btn btn-primary" onClick={() => window.location.href = '/create-parcel'}><Plus size={16}/> Создать посылку</button>
      </div>

      <div className="table-wrapper mb-8">
        <table>
          <thead><tr><th>Дата</th><th>ID Заказа</th><th>Трек-номер</th><th>Магазин</th><th>Сумма</th><th>Статус</th><th>Файлы</th><th>Действия</th></tr></thead>
          <tbody>
            {mockOrders.map(o => (
              <tr key={o.id}>
                <td>{o.date}</td><td><b>#{o.id}</b></td><td className="text-muted">{o.track}</td><td>{o.shop}</td><td><b>{o.sum}</b></td>
                <td><span className={`status ${o.status === 'В пути' ? 'yellow' : o.status === 'Доставлен' ? 'green' : 'blue'}`}>{o.status}</span></td>
                <td><div className="flex gap-2"><button className="icon-btn"><LinkIcon size={16}/></button><button className="icon-btn"><Download size={16}/></button></div></td>
                <td><button onClick={() => openPayModal(o)} className="btn btn-outline" style={{padding: '6px 12px', fontSize: 13}}>Оплатить</button></td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <h3 className="text-lg font-bold mb-4">Посылки пользователя Dmitro Karlov</h3>
      <div className="table-wrapper mb-8">
        <table>
          <thead><tr><th>Дата</th><th>Трек-номер</th><th>Вес</th><th>Сумма</th><th>Статус</th><th>Действия</th></tr></thead>
          <tbody>
            {mockShipments.map(s => (
              <tr key={s.id}><td>{s.date}</td><td>{s.track}</td><td>{s.weight}</td><td>{s.sum}</td><td><span className="status green">{s.status}</span></td><td><button className="btn btn-outline" style={{padding:'6px 12px', fontSize:13}}>Отследить</button></td></tr>
            ))}
          </tbody>
        </table>
      </div>

      <h3 className="text-lg font-bold mb-4">Транзакции пользователя Dmitro Karlov</h3>
      <div className="table-wrapper">
        <table>
          <thead><tr><th>Дата</th><th>Описание</th><th>Сумма</th><th>Статус</th></tr></thead>
          <tbody>
            {mockTransactions.map(t => (
              <tr key={t.id}><td>{t.date}</td><td>{t.desc}</td><td>{t.sum}</td><td><span className="status green">{t.status}</span></td></tr>
            ))}
          </tbody>
        </table>
      </div>

      {isModalOpen && (
        <div className="modal-overlay" onClick={() => setIsModalOpen(false)}>
          <div className="modal-content" onClick={e => e.stopPropagation()}>
            <h3 className="text-xl font-bold mb-2">Выберите метод оплаты:</h3>
            <p className="text-muted text-sm mb-6">Заказ #{selectedOrder?.id} на сумму <b>{selectedOrder?.sum}</b></p>
            <div className="flex flex-col gap-4">
              <label className="pay-option"><input type="radio" name="pay" defaultChecked/><b>VISA MASTERCARD</b><span className="text-xs text-muted">Комиссия 7%</span></label>
              <label className="pay-option"><input type="radio" name="pay"/><b>PAYPAL</b><span className="text-xs text-muted">Комиссия 7%</span></label>
            </div>
            <div className="flex gap-4 mt-8">
              <Button className="flex-1" onClick={confirmPay}>Перейти к оплате</Button>
              <button className="btn btn-outline" onClick={() => setIsModalOpen(false)}>Отмена</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
