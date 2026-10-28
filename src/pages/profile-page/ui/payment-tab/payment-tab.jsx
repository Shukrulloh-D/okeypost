import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export default function PaymentTab() {
  const { register } = useForm();
  return (
    <div>
      <h3 className="mb-8" style={{ fontSize: '20px' }}>Реквизиты для оплаты</h3>
      <div style={{ display: 'grid', gap: '16px' }}>
        <div><h4 style={{marginBottom: 8}}>Pay24</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px' }}>Номер кошелька: 4405XXXXXXXXX</div></div>
        <div><h4 style={{marginBottom: 8}}>PayPal</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px' }}>Email: test@okeypost.com</div></div>
        <div><h4 style={{marginBottom: 8}}>Unistream</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display:'grid', gap:8 }}><div style={{display:'flex', justifyContent:'space-between'}}><span>Name</span><span className="text-muted">Dmitro Karlov</span></div><div style={{display:'flex', justifyContent:'space-between'}}><span>Tel</span><span className="text-muted">+44 20 7946 0958</span></div></div></div>
        <div><h4 style={{marginBottom: 8}}>SWIFT</h4><div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display:'grid', gap:8 }}><div style={{display:'flex', justifyContent:'space-between'}}><span>IBAN</span><span className="text-muted">GB29 NWBK 6016 1331 9268 19</span></div><div style={{display:'flex', justifyContent:'space-between'}}><span>Банк</span><span className="text-muted">National Westminster Bank</span></div></div></div>
      </div>
    </div>
  );
}
