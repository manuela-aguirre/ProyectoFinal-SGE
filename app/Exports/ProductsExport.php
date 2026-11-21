<?php

namespace App\Exports;

use App\Models\Product;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

/**
 * Exporta el catálogo de productos a Excel.
 * FromQuery: lee de la BD por partes (sirve con miles de registros sin agotar la memoria).
 */
class ProductsExport implements FromQuery, ShouldAutoSize, WithHeadings, WithMapping, WithStyles
{
    public function __construct(private ?string $search = null) {}

    // Excel v4 exige el tipo de retorno en query() y map()
    public function query(): Builder
    {
        return Product::query()
            ->with('category')
            ->when($this->search, fn ($q) => $q->where('nombre', 'like', "%{$this->search}%"))
            ->orderBy('nombre');
    }

    // Primera fila del archivo
    public function headings(): array
    {
        return ['ID', 'Nombre', 'Descripción', 'Categoría', 'Precio', 'Stock', 'Valor inventario', 'Disponibilidad'];
    }

    // Cómo se convierte cada producto en una fila
    public function map(mixed $product): array
    {
        return [
            $product->id,
            $product->nombre,
            $product->descripcion,
            $product->category?->nombre,
            (float) $product->precio,
            $product->stock,
            (float) $product->precio * $product->stock,
            $product->stock > 0 ? 'Disponible' : 'Agotado',
        ];
    }

    public function styles(Worksheet $sheet): array
    {
        return [1 => ['font' => ['bold' => true]]]; // encabezado en negrita
    }
}
