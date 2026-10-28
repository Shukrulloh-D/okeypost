export default function AddressTab() {
  return (
    <div>
      <h3 className="mb-4">Ваш виртуальный адрес</h3>
      <div style={{ display: 'grid', gap: '8px' }}>
        {[ {l: 'Ваш ID Клиента', v: 'OK5556A654654'}, {l: 'Name, Surname', v: 'Karlov Dmitro OK5556...'}, {l: 'First line of address', v: 'Unit 5 Cromwell Estate'}, {l: 'Country', v: 'London'}, {l: 'Postcode', v: 'E10 7QE'}, {l: 'Town, City', v: 'London'}, {l: 'Country', v: 'Great Britain'}, {l: 'Telephone', v: '0730882545'} ].map((row, i) => (
          <div key={i} style={{ display: 'flex', background: '#F5F7FA', padding: '12px 16px', borderRadius: 8, fontSize: 14 }}><span style={{ width: 200, color: 'var(--text-muted)' }}>{row.l}:</span><span>{row.v}</span></div>
        ))}
      </div>
    </div>
  );
}
