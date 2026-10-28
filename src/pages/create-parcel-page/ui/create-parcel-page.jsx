import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
export default function CreateParcelPage() {
  const { register } = useForm();
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <h1 className="title-h1 mb-8">Создание посылки</h1>
      <div style={{ background: '#fff', padding: 32, borderRadius: 16 }}>
        <p className="text-muted mb-8">Трек-номер (не более 10 символов)</p>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20 }}>
          <Input label="Трек-номер" register={register('track')} placeholder="UK123456" />
          <Input label="Название магазина" register={register('shop')} placeholder="H&M" />
        </div>
        <p className="text-muted mt-8 mb-4">Доп. услуги:</p>
        <div style={{ display: 'flex', gap: 24, marginBottom: 24 }}>
           <label><input type="checkbox" /> Консолидация</label>
           <label><input type="checkbox" /> Усиленная упаковка</label>
           <label><input type="checkbox" /> Проверка вложений</label>
        </div>
        <Button>Создать посылку</Button>
      </div>
    </div>
  );
}
