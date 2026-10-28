import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { useForm } from 'react-hook-form';
export default function AddressBookPage() {
  const { register, handleSubmit } = useForm();
  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Адресная книга</h1>
      <form onSubmit={handleSubmit(()=>alert('Сохранено'))} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)' }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
          <Input label="Фамилия" register={register('surname')} /><Input label="Имя" register={register('name')} />
          <Input label="Область/регион" register={register('region')} /><Input label="Район" register={register('district')} />
          <Input label="Город" register={register('city')} /><Input label="Улица" register={register('street')} />
          <Input label="Дом" register={register('house')} /><Input label="Квартира" register={register('flat')} />
          <Input label="Индекс" register={register('index')} /><Input label="Телефон" register={register('phone')} />
        </div>
        <Button type="submit" className="mt-8">Сохранить</Button>
      </form>
    </div>
  );
}
