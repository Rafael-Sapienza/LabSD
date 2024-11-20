entity T06_SignalTb is
    end entity;
        
    architecture sim of T06_SignalTb   is

        signal MySignal : integer := 0;

    begin
        
        process is
            variable MyVariable : integer := 0;
        begin
            wait for 10 ns;
            MyVariable := MyVariable + 1;
            MySignal <= MySignal + 2;

            report "MyVariable = " & integer'image(MyVariable) & 
            ", MySignal = " & integer'image(MySignal);

            MyVariable := MyVariable + 1;
            MySignal <= MySignal + 3;

            report "MyVariable = " & integer'image(MyVariable) & 
            ", MySignal = " & integer'image(MySignal);

            --wait for 10 ns;

            report "MyVariable = " & integer'image(MyVariable) & 
            ", MySignal = " & integer'image(MySignal);
        
        end process;
        
    end architecture;