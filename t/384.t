use strict;
use warnings;
use Test::More;
use Digest::Keccak qw(keccak_384 keccak_384_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::Keccak->new(384)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(
            keccak_384_hex($data), $digest,
            "keccak_384_hex: $len bits of $msg"
        );
        ok(
            keccak_384($data) eq pack('H*', $digest),
            "keccak_384: $len bits of $msg"
        );
    }

    my $md = Digest::Keccak->new(384)->add_bits($data, $len)
        ->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $len bits of $msg");
}
continue { $len++ }

done_testing;

__DATA__
00|2C23146A63A29ACF99E73B88F8C24EAA7DC60AA771780CCC006AFBFA8FE2479B2DD2B21362337441AC12B515911957FF
00|4C6D164043571A32E169A527CA3503EA391BF91F22287215DF75EA243D53A0D042BC66EFE2956D8606A24F39E255A081
C0|C7058511440BE5D4F5688EF721000E91244AD6D10FEE477DCCB84E8B84DB897F51DB533E49964B18E5E362E5FD569E19
C0|3C297324D6F43BE6A5B784C25B559910B6F79EF3C74DB21575325CC9C917D935D8C3D6A9AA34F9FC65F1E9C39ABC83AB
80|B43AF6CCF78FC5CAB63EB7CDA68FD89E95C506EEA63C131A82F9D9A1798002BB40D3B78473C3A66456034720BA8142E2
48|6877F31B109EBC6DDAB14087739D7702F7E2AA2DD9D54B3B9C04749CB1ADEA194A52496DC78ADCEE84E705621F0564CC
50|B7136D3EF3112A47C1C59C5FAB6A40C6ECD7CC89E400DC2EFAE388DEC1028985E138A2B2F54683A8814EF3C1BA28EA9C
98|748DE17DCCB6B3FBAA1C938F5A3167244C83683105D45D429F0B40B31D9317860529EA54BFDE1521423CEDA9DEBD9D73
CC|1B84E62A46E5A201861754AF5DC95C4A1A69CAF4A796AE405680161E29572641F5FA1E8641D7958336EE7B11C58F73E9
9800|3D368329F238F523317E7FA24C9B30603845942D3DA0BB09BD3BC99A702F2159E0504CEAAE888DE125FBA1F64F36DFB6
9D40|D5BA248B961632CF08CD446351C184AB0F070C5668A6C96FA3D0A18FAE8A215610797880E5EB2C45E9F5637D1D3E397E
AA80|530A46AEE9512C334F64BD1DD24A3E993868389CC5F811D7034AF601E896E2B6CC003F6CF5D641CCEDB3E0EF221FB705
9830|9C25B57E27123FCDE904EEC5931ACC330DA272C92D545795D04066BD9962F28EDCC2E0EBA52D7100C13D73439E2CB568
5030|C0BFE1527CA439FB70A82041521FDC1277AC2DB22FB844CB1300F6CCA147E1978A49D9392E4F6A277C9A68FB9C9F1CAB
4D24|548585D36717CE7B8AC7A7B1B2540312697CC98FD6E9FD3557ED27114A3CC1B1802D3512A3A63FA3E733ED274601C69E
CBDE|A5F1B2C8F5A92A45E5622455B8A1FD1EF26310B180A9D7DB5A3D8413D8ABF140C70C1BDBD91DC5E609042CE88AD9CC9E
41FB|495CCE2714CD72C8C53C3363D22C58B55960FE26BE0BF3BBC7A3316DD563AD1DB8410E75EEFEA655E39D4670EC0B1792
4FF400|A937B475A5FF181B40E09262EE6D84683F08E7C5F5050A732A462E0A285D5F963BB78D2A4E3A1668EB6A745A0DE6920C
FD0440|B9B89E3888005273A964553CB6F6104F02564C283D34E64D6B7EC8087A0B4A215B5B3D18753A1C9B0FDA33981A7D89E9
424D00|BB209F04AC4E406F4F852D83FC1BF419EA6D4C7D94054020DFAC35F16697FAE7A2A1A505167BDAF5E387E9279018A786
3FDEE0|C75BBEBCF97BD4F0397A0734BE0EBFE93F4F4D44EFC317EBB51A38636414DBAD650D2103A22FCF6453D3A851A44B8149
335768|BC2908471D9EBBCFE44387B99C7095DF1A902BA14E06F8AA6EA326478B5695A13DC6529F2E7F590A76A5FBCAC2A55F43
051E7C|74D653164A38906965CFFA347924BC01FAF8DBB1D2EA2303B3E742F818A9A320EF2BAD7451712BE364021A7629DEF7C9
717F8C|A658A0FBC03B682D4B02FA7F62D61B80DEFDB2FA335526CD16EF9F8FE9DEF0ECC74BFAC46FC8739B5027178BD374651B
1F877C|B0665C345F45E6DE145B0190335EF5D5AA59E0B49FC1425D5EAE7355EA442284CB8A2152D565EBDF2810ECCAB15AF04F
EB35CF80|6B1CD45FEF2D90B2362BC397D9E6FF27F287DF98D4428D19AAD96BC1D930E254E3745485F976050B790C6F8F0303DAEA
B406C480|AA7530AF6F63A1B13C9395A2C35308B77E191637FFD6DD6054026E9AD05EF478349C7EF5A13C8CD07F8DE788D0CDC850
CEE88040|CC666BA708F83FED8F065F46457CF6D0B3D9F73438F322F85EA6A3566D087D292C3788E365FB4AA123F4936B83440209
C584DB70|ECBD65EF447FB3DF60B041B53EB64CDE19D3B2B3C8DE04DFC514D6A8DF3390996217AD163769495C1D03BE8091348B67
53587BC8|1CF5FE44300E88B44BC620F13E8269030FCBA1A5DC490CE1336465AD03AEABD331F15B657853D5E773E8F5C9BF93E7D2
69A305B0|36808A9A3DDDB70E51ADF7C6D27C59583FB1C33E9827F33FF1671D3E767F37574AA4EA70684D2C25BA10E6ABDC0CAE38
C9375ECE|959254829EB200A7ED0F8701D3BD60E452B8C175BF4B851219A92914CD6EA571DEA49B89A4339F9DD707BFE0687EF4ED
C1ECFDFC|F1850B2ABB24F3FD683C701582789D9E92B6A45F9C345F9DAE7F7997C8C910E88003E592E59281CF92C92D6B51A1AFD1
8D73E8A280|6C381B9488768084838A1C80D7486F26D0DD1F5E75F0063A314025F1D44FED08C5F5F81CCB5D6E7AE5556DDF3A4B5335
06F2522080|C3541CE36DCCA3535474A5C44C3F9284216D013306E0CA182EC834314378229BBA9DFB5ABBB81EF25ECC4B31F3D4C6D8
3EF6C36F20|6BF089552F9516AC972794733146DE46D6B211624AD1EEC05537256D553A9D48D99CB2392D0CCE09DE92B13BE73AE8A3
0127A1D340|D42D2B4502CFD7A1FCEBE14B031CA9A00C95EB85CB713B779A9ABF302AE48796F0039FE0B864A72A44310DDCBDC70616
6A6AB6C210|18B53BB34A8737EB1DAF87758DE07385F701EA253B10E4D2262EA68FDB6B921E75AF769050056039270EFBD8A501722A
AF3175E160|45703EDEFA6AC0C410FD7644853251CA02A88223B408ADD378B33A5B48207AC7FAEF46E96ECBC19A31EA7E326FD808DA
B66609ED86|0E367CAE59CEFF3F3AE6DE2D11DC854597BB8CBB331D3BCA03FD7149B93668F6997F9DB4B48FCAD99DD29FAF09BD75CC
21F134AC57|68D437327F158287C304BBAF36F782F497DA2C480A1FBB268682362218641F9070A014919AD7331C49BEEFCCB437FE9A
3DC2AADFFC80|FFC924DF424502692B32D57650E1DB5425F0BD26D381D74B3FD2237A01DE522FAC5B0848A145D4A514110E0A8CA51B41
9202736D2240|9F139345B6F463AACDEF0A5F26381A473F6FFCCBCA2A86ECB55F1AC9B206188469422C67F79F4B5D70C313BD511F60D6
F219BD629820|7BB77F86F790AD5A0FF44A17668422DA9AFD4651B53F0236D10B7FC937298E3CA326CED96AA6B53CB3FD1876146B46A6
F3511EE2C4B0|227416DC5BD4FFB96DC2C24078E4FE956C49DB45D26944F6F1D7F16B1E1BF6A0E14697D4613CD4F39273AE9C8C8E4BE3
3ECAB6BF7720|495A6A7B29F29BA7EBF2283EF3FDE6F37D6AE34F548A69986494F393B56BE655F275C232B20E778D09E7680C2FAD58FA
CD62F688F498|6E0BA20A741FA548379E144486EC93160A0464A0E8F1E2F64B69A446902A2912581C59EE9BB6846D8557D67163D9082F
C2CBAA33A9F8|4CABCD60BAFD4064D48809D55B27F44BF7B88287EF32DC2133B98F42F1D2A66F3A0705FD712ACA8F9F12198B7AA03342
C6F50BB74E29|03566EC003FF55184F0C85BEEBC6D1ECF5E5D082D8D40137246F8FD42BCE097C09418845EF60286FDD894A00FD2D6589
79F1B4CCC62A00|A719EF014A88F63C100FDBEC7AC3F403ED2BA57879A05ADB66D5CFCE4CE628C6DD4DB995459256D7029D64306319083C
