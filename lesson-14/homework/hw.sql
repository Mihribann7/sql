DECLARE @tableHTML NVARCHAR(MAX);

SET @tableHTML = 
    N'<html>
    <head>
    <style>
        table { font-family: Arial; border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
        th { background-color: #f2f2f2; }
    </style>
    </head>
    <body>
    <h3>Index Metadata Report</h3>
    <table>
        <tr>
            <th>Table Name</th>
            <th>Index Name</th>
            <th>Index Type</th>
            <th>Column Name</th>
        </tr>' +
    (
        SELECT 
            td = 
            STRING_AGG(
                '<tr><td>' + sch.name + '.' + t.name + '</td>' +
                '<td>' + i.name + '</td>' +
                '<td>' + i.type_desc + '</td>' +
                '<td>' + c.name + '</td></tr>', ''
            )
        FROM 
            sys.indexes i
            INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
            INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
            INNER JOIN sys.tables t ON i.object_id = t.object_id
            INNER JOIN sys.schemas sch ON t.schema_id = sch.schema_id
        WHERE 
            i.type_desc <> 'HEAP'
    ) +
    '</table>
    </body>
    </html>';

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'nosirovamehribon7@gmail.com', 
    @recipients = 'aaaa@gmail.com',
    @subject = 'SQL Server Index Metadata Report',
    @body = @tableHTML,
    @body_format = 'HTML';
