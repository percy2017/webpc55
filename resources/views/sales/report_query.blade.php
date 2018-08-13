@switch($table)
    @case(1)
        @switch($table_option)
            @case(1)
                           
                @break

            @case(2)
                
                @break

            @default
                Default case...
        @endswitch
        @break

    @case(2)
    @switch($table_option)
            @case(1)
                          
                @break

            @case(2)
              
                @break

            @default
                Default case...
        @endswitch
        @break

    @default
        Default case...
@endswitch