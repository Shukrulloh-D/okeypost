import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { ArrowLeft, CreditCard, Wallet } from 'lucide-react';
import { Button } from '@/shared/ui/button';
import { useToastStore } from '@/shared/ui/toast';
import './top-up-page.css';

export default function TopUpPage() {
  const navigate = useNavigate();
  const [amount, setAmount] = useState('');
  const [method, setMethod] = useState('card');
  const addToast = useToastStore((s) => s.addToast);

  const handlePay = () => {
    if (!amount || Number(amount) <= 0) { addToast('Введите сумму', 'error'); return; }
    addToast(`Баланс пополнен на ${amount} ₽ через ${method === 'card' ? 'карту' : 'PayPal'}`, 'success');
    setTimeout(() => navigate('/profile'), 1500);
  };

  return (
    <div style={{ maxWidth: 600, margin: '0 auto' }}>
      <a href="#" onClick={(e) => { e.preventDefault(); navigate('/profile'); }} className="flex items-center gap-2 text-muted mb-6 text-sm">
        <ArrowLeft size={16}/> Назад в профиль
      </a>
      <h2 className="title-h2 mb-2">Пополнение баланса</h2>
      <p className="text-muted text-sm mb-8">Выберите сумму и способ оплаты</p>

      <div className="card">
        <label className="block text-sm font-medium text-muted mb-2">Сумма пополнения (₽)</label>
        <input type="number" value={amount} onChange={(e) => setAmount(e.target.value)} placeholder="Введите сумму" className="w-full p-4 border rounded-lg text-2xl font-bold outline-none focus:border-primary-blue mb-3" style={{padding: 16, borderRadius: 10, border: '1.5px solid var(--border)', fontSize: 24, fontWeight: 700}} />

        <div className="flex gap-3 mb-8">
          {[500, 1000, 3000, 5000].map(v => (
            <button key={v} type="button" onClick={() => setAmount(String(v))} className="btn btn-outline" style={{padding: '8px 16px', fontSize: 13}}>{v} ₽</button>
          ))}
        </div>

        <h3 className="text-lg font-bold mb-4">Способ оплаты:</h3>
        <div className="flex flex-col gap-3 mb-8">
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

        <Button className="w-full" onClick={handlePay} disabled={!amount}>
          Пополнить на {amount || 0} ₽
        </Button>
      </div>
    </div>
  );
}
