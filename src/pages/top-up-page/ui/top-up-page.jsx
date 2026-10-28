import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, CreditCard, Wallet } from 'lucide-react';
import { Button } from '@/shared/ui/button';

export default function TopUpPage() {
  const [amount, setAmount] = useState('');
  const [method, setMethod] = useState('card');

  return (
    <div style={{ maxWidth: 600, margin: '0 auto' }}>
      <Link to="/profile" className="flex items-center gap-2 text-muted mb-6 text-sm">
        <ArrowLeft size={16}/> Назад в профиль
      </Link>
      <h2 className="title-h2 mb-2">Пополнение баланса</h2>
      <p className="text-muted text-sm mb-8">Выберите сумму и способ оплаты</p>

      <div className="bg-white p-8 rounded-2xl">
        <label className="block text-sm font-medium text-muted mb-2">Сумма пополнения (₽)</label>
        <input type="number" value={amount} onChange={(e) => setAmount(e.target.value)} placeholder="Введите сумму" className="w-full p-4 border border-gray-200 rounded-lg text-2xl font-bold outline-none focus:border-primary-blue" />

        <div className="flex gap-3 mt-3">
          {[500, 1000, 3000, 5000].map(v => (
            <button key={v} type="button" onClick={() => setAmount(String(v))} className="btn btn-outline" style={{padding: '8px 16px', fontSize: 13}}>{v} ₽</button>
          ))}
        </div>
 
        <h3 className="text-lg font-bold mt-8 mb-4">Способ оплаты:</h3>
        <div className="flex flex-col gap-3">
          <label className={`pay-method-option ${method === 'card' ? 'selected' : ''}`} onClick={() => setMethod('card')}>
            <input type="radio" checked={method === 'card'} readOnly/>
            <CreditCard size={24} color="var(--primary-blue)"/>
            <div><b>Банковская карта</b><p className="text-xs text-muted">Visa / Mastercard</p></div>
          </label>
          <label className={`pay-method-option ${method === 'paypal' ? 'selected' : ''}`} onClick={() => setMethod('paypal')}>
            <input type="radio" checked={method === 'paypal'} readOnly/>
            <Wallet size={24} color="var(--primary-blue)"/>
            <div><b>PayPal</b><p className="text-xs text-muted">Оплата через PayPal</p></div>
          </label>
        </div>

        <Button className="w-full mt-8" onClick={() => alert(`Пополнение на ${amount} ₽ через ${method}`)} disabled={!amount}>
          Пополнить на {amount || 0} ₽
        </Button>
      </div>

      <style>{`
        .pay-method-option { display: flex; align-items: center; gap: 16px; padding: 16px; border: 2px solid var(--border); border-radius: 12px; cursor: pointer; transition: 0.2s; }
        .pay-method-option:hover, .pay-method-option.selected { border-color: var(--primary-blue); background: #F0F9FF; }
      `}</style>
    </div>
  );
}
