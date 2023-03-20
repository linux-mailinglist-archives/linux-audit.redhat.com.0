Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 362696C128E
	for <lists+linux-audit@lfdr.de>; Mon, 20 Mar 2023 14:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679317469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nq1ALzD9J/0EHHXhB8LE3dI/8wCMmMpNTnaeTIsn4Z4=;
	b=NExJjvOD/tSbmEv6Tx5ktz4n1fAr8JwaqYhiGs0vYI5yjcKpIlWcBM1Thn2vY5sOAzjmPx
	CWKl2dSpz9cOwdXPZQo4FUPyZi2tAFku8zLxlpL2m1M/popJrIhKl/QJ8xpv0JD8PeJ5bm
	B3L1hT9GqCg7b9YxzE1m0sg1mQWn3rc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-_ti9pT8GMRabeNldcc2JFw-1; Mon, 20 Mar 2023 09:04:27 -0400
X-MC-Unique: _ti9pT8GMRabeNldcc2JFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AB668828C4;
	Mon, 20 Mar 2023 13:04:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E91B140EBF4;
	Mon, 20 Mar 2023 13:04:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BBCC719465B9;
	Mon, 20 Mar 2023 13:04:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B75281946594 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 13:04:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6C2B492C14; Mon, 20 Mar 2023 13:04:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E08C492C13
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 13:04:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D0A9101A553
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 13:04:17 +0000 (UTC)
Received: from MX2.LL.MIT.EDU (mx2.ll.mit.edu [129.55.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-FB1vsrP3P52evDeIols23w-1; Mon, 20 Mar 2023 09:04:15 -0400
X-MC-Unique: FB1vsrP3P52evDeIols23w-1
Received: from LLEX2019-3.mitll.ad.local (llex2019-3.llan.ll.mit.edu
 [172.25.4.125])
 by MX2.LL.MIT.EDU (8.17.1.19/8.17.1.19) with ESMTPS id 32KD4ArX167237
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Mar 2023 09:04:10 -0400
From: "Christiansen, Edward - 0992 - MITLL" <edwardc@ll.mit.edu>
To: "burn@swtf.dyndns.org" <burn@swtf.dyndns.org>, "linux-audit@redhat.com"
 <linux-audit@redhat.com>
Subject: RE: run script after auditd rotates logs
Thread-Topic: run script after auditd rotates logs
Thread-Index: AdlZpqI3R4ioBZC7RFGR0bgFiGsa+QAWxicAAEqsX8A=
Date: Mon, 20 Mar 2023 13:04:12 +0000
Message-ID: <BN0P110MB1210BC43B748D8E40905B6699C809@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
 <c1a23e6bbb140660a5de48f89e9b8b7723d66ea8.camel@iinet.net.au>
In-Reply-To: <c1a23e6bbb140660a5de48f89e9b8b7723d66ea8.camel@iinet.net.au>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1210:EE_|BN0P110MB1339:EE_
x-ms-office365-filtering-correlation-id: 8f73b523-1531-4f8d-7e94-08db29439a01
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ZIVUt5bvJ7MPqRRRu3rHxYCLKvaAxpn6uvDTPR+NfZfEj6wZGjSvHUsvTKw76h7p1co5F/IZ3A2eME6Z99h36f1os25OGLzCjdUGgcGyrjSLdculhWUPd1iLzZprMSI0qAiGTLi3h4qANCZtzDWwRgvA/FanpwiGgVE2WLgtBs5im/9krYC7V6ZF7bWSkTuyW2zmBTQbNwzGvUfWrF9rumHHQ/A/QCsNBlPd1uyevAdiodMG0WdA5RpHKFFZ4RGVG2Q0UIhyAPJzLTJvtxWC8p+gNxIVFgoA5IDMC5eH4Ke+O9UADz4oCAW1wxPwYrHUrsbUnXEbFiSft6IHltTqAAMJGKWhw4Sx9gtH7zjOUN4shT/23dFfkVHHeCGFpCdx3Y/i7ID9scnJPj5bIB7izhXqBW2OrFoQ83vE/9EMMf6g8ygPy+OieQCrcDRNQ/nhddMZqm3u6bqqIrMctOf1ypggFHrKvqFJW+nd1pwZUOUjCxFdUpnWX+FJJ2EVANOtgn6FgobW5PRymHmR0FLv4Bz+eb3nlxzdELDFU2O94A/6a7rW3DFFjTwAFiuwkWEIAfbYwWC2Y9JBXdEiZm0ru747LBGzm5XWsjnKDRoiJa8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(136003)(396003)(366004)(451199018)(38100700002)(99936003)(38070700005)(26005)(166002)(33656002)(86362001)(122000001)(2906002)(52536014)(41300700001)(5660300002)(41320700001)(8936002)(75432002)(6506007)(9686003)(186003)(53546011)(83380400001)(110136005)(66556008)(8676002)(66476007)(66446008)(7696005)(64756008)(508600001)(55016003)(66946007)(76116006)(966005)(71200400001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: /pixtC5/wzmXn5mcOC3xhhLeUfwSOkPACbZ0ndG3olmH3JB7uPcHNfUUJODyP9p4JtOXccj/laowOYKakhqjW8o7u64by8REIpCrLEaKW3vX6CLuz+SyzPXaklYG0d3jIeo7h82rc0DT4/elsOmttUs5xxe0+Mjlf1wY/43r45ab4h52/dC9Y62LHjAQiTDwCkpvo6CstbHvi2JbxftZ+iFZCajbibgml/HPlUZvjOfFkLMq7DkKTfoV5z8isjBJzDI3k/LDf+rQnm4xLactDn8l1XSEYscjMxMG8U1aFznbFmIhW4AlWt++quk0DlTjZSqcu31al6Ft18E6ZXSrJtC/HmUp0yUmse/37LkyqjqV4m9aYskdW8GvxrSPDoYyOdFrdRnKolzcw4qX80DiXUIRhdxOE3ZgyjOmyOfsWhI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f73b523-1531-4f8d-7e94-08db29439a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 13:04:12.5769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 83d1efe3-698e-4819-911b-0a8fbe79d01c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1339
X-Proofpoint-GUID: 5eevNMRA0jSCgG9ZnAdH_pAvK3dr-cpw
X-Proofpoint-ORIG-GUID: 5eevNMRA0jSCgG9ZnAdH_pAvK3dr-cpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_08,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200110
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============3533318773064441585=="

--===============3533318773064441585==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_000D_01D95B0A.EF4271D0"

------=_NextPart_000_000D_01D95B0A.EF4271D0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_000E_01D95B0A.EF4271D0"

------=_NextPart_001_000E_01D95B0A.EF4271D0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Thanks.  This is definitely the info I was looking for.



From: Burn Alting <burn.alting@iinet.net.au>
Sent: Saturday, March 18, 2023 9:26 PM
To: Christiansen, Edward - 0992 - MITLL <edwardc@ll.mit.edu>; 
linux-audit@redhat.com
Subject: Re: run script after auditd rotates logs



Ed,



One indirect way of achieving this is to author a script that

- sends SIGUSR1 to the auditd process (which causes auditd to immediately 
rotate the logs. It will consult the max_log_file_action to see if it should 
keep the logs or not.)

- do whatever you need to do with the rolled over audit.log files



Clearly you only have access to the rolled over log files (given that's what 
you want).



Rgds





On Sat, 2023-03-18 at 14:36 +0000, Christiansen, Edward - 0992 - MITLL wrote:

I would like to know if there is a way to tell auditd to run a script or
command after it rotates its logs.  I can do this with logrotate, but would
much prefer something native to auditd.  I spent some toime with Google and
found only logrotate solutions.

Thanks,

Ed Christiansen
Millstone Hill SysAdmin
--
Linux-audit mailing list

 <mailto:Linux-audit@redhat.com>

Linux-audit@redhat.com <mailto:Linux-audit@redhat.com>





 <https://listman.redhat.com/mailman/listinfo/linux-audit>

https://listman.redhat.com/mailman/listinfo/linux-audit






------=_NextPart_001_000E_01D95B0A.EF4271D0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dutf-8"><meta name=3DGenerator content=3D"Microsoft=
 Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
pre
=09{mso-style-priority:99;
=09mso-style-link:"HTML Preformatted Char";
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:10.0pt;
=09font-family:"Courier New";}
p.msonormal0, li.msonormal0, div.msonormal0
=09{mso-style-name:msonormal;
=09mso-margin-top-alt:auto;
=09margin-right:0in;
=09mso-margin-bottom-alt:auto;
=09margin-left:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.HTMLPreformattedChar
=09{mso-style-name:"HTML Preformatted Char";
=09mso-style-priority:99;
=09mso-style-link:"HTML Preformatted";
=09font-family:"Consolas",serif;}
span.EmailStyle20
=09{mso-style-type:personal-reply;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><font size=3D2 f=
ace=3DCalibri><span style=3D'font-size:11.0pt'>Thanks.=C2=A0 This is defini=
tely the info I was looking for.<o:p></o:p></span></font></p><p class=3DMso=
Normal><font size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>=
&nbsp;</o:p></span></font></p><div><div style=3D'border:none;border-top:sol=
id #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><font s=
ize=3D2 face=3DCalibri><span style=3D'font-size:11.0pt;font-weight:bold'>Fr=
om:</span></font></b> Burn Alting &lt;burn.alting@iinet.net.au&gt; <br><b><=
span style=3D'font-weight:bold'>Sent:</span></b> Saturday, March 18, 2023 9=
:26 PM<br><b><span style=3D'font-weight:bold'>To:</span></b> Christiansen, =
Edward - 0992 - MITLL &lt;edwardc@ll.mit.edu&gt;; linux-audit@redhat.com<br=
><b><span style=3D'font-weight:bold'>Subject:</span></b> Re: run script aft=
er auditd rotates logs<o:p></o:p></p></div></div><p class=3DMsoNormal><font=
 size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p>=
</span></font></p><div><p class=3DMsoNormal><font size=3D2 face=3DCalibri><=
span style=3D'font-size:11.0pt'>Ed,<o:p></o:p></span></font></p></div><div>=
<p class=3DMsoNormal><font size=3D2 face=3DCalibri><span style=3D'font-size=
:11.0pt'><o:p>&nbsp;</o:p></span></font></p></div><div><p class=3DMsoNormal=
><font size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'>One indirec=
t way of achieving this is to author a script that<o:p></o:p></span></font>=
</p></div><div><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span sty=
le=3D'font-size:11.0pt'>- sends SIGUSR1 to the auditd process (which causes=
 auditd to immediately rotate the logs. It will consult the max_log_file_ac=
tion to see if it should keep the logs or not.)<o:p></o:p></span></font></p=
></div><div><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span style=
=3D'font-size:11.0pt'>- do whatever you need to do with the rolled over aud=
it.log files<o:p></o:p></span></font></p></div><div><p class=3DMsoNormal><f=
ont size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>&nbsp;</o=
:p></span></font></p></div><div><p class=3DMsoNormal><font size=3D2 face=3D=
Calibri><span style=3D'font-size:11.0pt'>Clearly you only have access to th=
e rolled over log files (given that's what you want).<o:p></o:p></span></fo=
nt></p></div><div><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p></div><div><p=
 class=3DMsoNormal><font size=3D2 face=3DCalibri><span style=3D'font-size:1=
1.0pt'>Rgds<o:p></o:p></span></font></p></div><div><p class=3DMsoNormal><fo=
nt size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>&nbsp;</o:=
p></span></font></p></div><div><p class=3DMsoNormal><font size=3D2 face=3DC=
alibri><span style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p>=
</div><div><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span style=
=3D'font-size:11.0pt'>On Sat, 2023-03-18 at 14:36 +0000, Christiansen, Edwa=
rd - 0992 - MITLL wrote:<o:p></o:p></span></font></p></div><blockquote styl=
e=3D'border:none;border-left:solid #729FCF 1.5pt;padding:0in 0in 0in 6.0pt;=
margin-left:4.8pt;margin-right:0in'><pre><font size=3D2 face=3D"Courier New=
"><span style=3D'font-size:10.0pt'>I would like to know if there is a way t=
o tell auditd to run a script or <o:p></o:p></span></font></pre><pre><font =
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'>command afte=
r it rotates its logs.=C2=A0 I can do this with logrotate, but would <o:p><=
/o:p></span></font></pre><pre><font size=3D2 face=3D"Courier New"><span sty=
le=3D'font-size:10.0pt'>much prefer something native to auditd.=C2=A0 I spe=
nt some toime with Google and <o:p></o:p></span></font></pre><pre><font siz=
e=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'>found only logr=
otate solutions.<o:p></o:p></span></font></pre><pre><font size=3D2 face=3D"=
Courier New"><span style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></fon=
t></pre><pre><font size=3D2 face=3D"Courier New"><span style=3D'font-size:1=
0.0pt'>Thanks,<o:p></o:p></span></font></pre><pre><font size=3D2 face=3D"Co=
urier New"><span style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font>=
</pre><pre><font size=3D2 face=3D"Courier New"><span style=3D'font-size:10.=
0pt'>Ed Christiansen<o:p></o:p></span></font></pre><pre><font size=3D2 face=
=3D"Courier New"><span style=3D'font-size:10.0pt'>Millstone Hill SysAdmin<o=
:p></o:p></span></font></pre><pre><font size=3D2 face=3D"Courier New"><span=
 style=3D'font-size:10.0pt'>--<o:p></o:p></span></font></pre><pre><font siz=
e=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'>Linux-audit mai=
ling list<o:p></o:p></span></font></pre><p class=3DMsoNormal><font size=3D2=
 face=3DCalibri><span style=3D'font-size:11.0pt'><a href=3D"mailto:Linux-au=
dit@redhat.com"><o:p></o:p></a></span></font></p><pre><u><font size=3D2 col=
or=3Dblue face=3D"Courier New"><span style=3D'font-size:10.0pt;color:blue'>=
<a href=3D"mailto:Linux-audit@redhat.com">Linux-audit@redhat.com<font color=
=3Dblack><span style=3D'color:windowtext;text-decoration:none'><o:p></o:p><=
/span></font></a></span></font></u></pre><p class=3DMsoNormal><font size=3D=
2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span><=
/font></p><pre><font size=3D2 face=3D"Courier New"><span style=3D'font-size=
:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><p class=3DMsoNormal><font si=
ze=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><a href=3D"https://l=
istman.redhat.com/mailman/listinfo/linux-audit"><o:p></o:p></a></span></fon=
t></p><pre><u><font size=3D2 color=3Dblue face=3D"Courier New"><span style=
=3D'font-size:10.0pt;color:blue'><a href=3D"https://listman.redhat.com/mail=
man/listinfo/linux-audit">https://listman.redhat.com/mailman/listinfo/linux=
-audit<font color=3Dblack><span style=3D'color:windowtext;text-decoration:n=
one'><o:p></o:p></span></font></a></span></font></u></pre><p class=3DMsoNor=
mal><font size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><o:p>&nb=
sp;</o:p></span></font></p><pre><font size=3D2 face=3D"Courier New"><span s=
tyle=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre></blockquote=
></div></body></html>
------=_NextPart_001_000E_01D95B0A.EF4271D0--

------=_NextPart_000_000D_01D95B0A.EF4271D0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCElkw
ggOKMIICcqADAgECAgEBMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNVBAYTAlVTMR8wHQYDVQQKExZN
SVQgTGluY29sbiBMYWJvcmF0b3J5MQwwCgYDVQQLEwNQS0kxGDAWBgNVBAMTD01JVExMIFJvb3Qg
Q0EtMjAeFw0xNjA0MjAxMjAwMDBaFw0zNTA0MTkyMzU5NTlaMFYxCzAJBgNVBAYTAlVTMR8wHQYD
VQQKExZNSVQgTGluY29sbiBMYWJvcmF0b3J5MQwwCgYDVQQLEwNQS0kxGDAWBgNVBAMTD01JVExM
IFJvb3QgQ0EtMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL91qARBjjibZuLnL2n+
ryiBT7PMGrQnekpsKv13kTaOz94zyMTT8Bd/fERg1JjySFwO4ncw+o9KKRSFvpC6mMnvXu/PD1dH
amiZV/PNfHzQ20hPvAeoYnqik0e1XziO+FFUBFClURbkRcOrlWLr4HsNk4/wtnRHnt+3q7kJeZx5
G1djrFp2ezvsrfnrXeh0XGly5T/avFioANwe75DlSDAiqALmlo/gRauyvljZIsovynTh/SZjqW8k
SuI3AO8Wy5xfCRVEjYOXOGNQSaxWmbZAnhujZvaeduBpZZERcz4KY/FYnFfgCvva2NO3U8dNpGKL
U5yrstGMQQMLFF8QEBMCAwEAAaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU/8nJZUxT
gPGpDDwhroIqx+74MvswHwYDVR0jBBgwFoAU/8nJZUxTgPGpDDwhroIqx+74MvswDgYDVR0PAQH/
BAQDAgGGMA0GCSqGSIb3DQEBCwUAA4IBAQB6mHxH/9yeWjCoZWEND51AGzAfI2Uq/fx743zhdNHK
xVAn0q6hvCUMKPkv4quuoHKethRICdH0JA4FYOpvgthE6NS6FoksYWAn3EiEBApY5V8EfMBUmshf
NtkuvSKrx4XauHefI1OoGIurLI1OL8LL7FS0SSpP5vwoP8PIFumBzOWoQQ+v+QnHpdnyO6EprJDv
fdfqLawtdWHw8Ahb8+wJtK/ivYlYUlrWuIZiLldGAYmtO3mSkjtNiz4EPGDs95LtGLfpofFVkSrs
dgnGIzKZPlg1dATKe+bam+qagRZHCrxAV6sYPvPhv7po4ouB9HOZLyYWkMspG5jipsTvSHCSMIIE
wDCCA6igAwIBAgIBBjANBgkqhkiG9w0BAQsFADBWMQswCQYDVQQGEwJVUzEfMB0GA1UEChMWTUlU
IExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECxMDUEtJMRgwFgYDVQQDEw9NSVRMTCBSb290IENB
LTIwHhcNMTcwMzAyMTIwMDAwWhcNMjYwMzAyMjM1OTU5WjBRMQswCQYDVQQGEwJVUzEfMB0GA1UE
CgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECwwDUEtJMRMwEQYDVQQDDApNSVRMTCBD
QS01MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp5qDDr05H8O56tfZq1msxmmvkPN1
L9PgE1096upK/lhMSDCGfOwu+FgnEV6bzu7r8ex7zLGFgBR1vd8EMIY8rcRyDmYCjSeFZxlQ1Jfi
iO4NJ/fmY7d4Qdx4R23L23vfmOI8/l8woi5djmmLyAim8b2wUgi7TxHmUOsek2+hCtMptIL2Hhzt
5LrmPkiRyTJbW6y5yFS8Y2azVUu+81yr7ukN4UnZESAe5CYBF3y/qf8/9qfeGxBGdk50M9E5Doxv
iau1JV5RUbb7GHAzxEA91DZGbFnF4AtYVxvExpJ1HAIZRsVYZSpRS5jXe9+NrHhstrPWMTQ50hPn
l07W9COSywIDAQABo4IBnDCCAZgwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUL++7xg0d
u+lq/qxn8wc7CHb2S1kwHwYDVR0jBBgwFoAU/8nJZUxTgPGpDDwhroIqx+74MvswDgYDVR0PAQH/
BAQDAgGGMGcGCCsGAQUFBwEBBFswWTAuBggrBgEFBQcwAoYiaHR0cDovL2NybC5sbC5taXQuZWR1
L2dldHRvL0xMUkNBMjAnBggrBgEFBQcwAYYbaHR0cDovL29jc3AubGwubWl0LmVkdS9vY3NwMDQG
A1UdHwQtMCswKaAnoCWGI2h0dHA6Ly9jcmwubGwubWl0LmVkdS9nZXRjcmwvTExSQ0EyMIGSBgNV
HSAEgYowgYcwDQYLKoZIhvcSAgEDAQYwDQYLKoZIhvcSAgEDAQgwDQYLKoZIhvcSAgEDAQcwDQYL
KoZIhvcSAgEDAQkwDQYLKoZIhvcSAgEDAQowDQYLKoZIhvcSAgEDAQswDQYLKoZIhvcSAgEDAQ4w
DQYLKoZIhvcSAgEDAQ8wDQYLKoZIhvcSAgEDARAwDQYJKoZIhvcNAQELBQADggEBADCWEcCzyfdS
u3tpgNjY9dFtKOSTB2JGmvnLS/P8WPEMyBxSOSI/osnaTzfSgmJ/+EsvNE92jaGJBZUtBkUF4X9J
7ImO01icACsOAIjv8id+/6ESkYLckYnL2iekY5RwlwTmpRS8PVLaaHT+P4nQudZcc7KJWkGa2gY1
Xuzy/eT4Uuw/ttjX3yJ8y3SG9QwX+eDcDlXzyIAAbcR9X4Wa42uxIUfUaFMORNTuolmgLj/8VoUk
0BVpYcgNP5JCIvfx12mNIWJ4XI3Gzz6o6cnyIUhY414Y6iu7dsD60qwRSxVG5y4jZYEB67zWBeSK
oCH50gViK5t63y4aWWSf8Se2H+gwggT+MIID5qADAgECAhNZAAUN4Hhrq/T/w8VHAAAABQ3gMA0G
CSqGSIb3DQEBCwUAMFExCzAJBgNVBAYTAlVTMR8wHQYDVQQKDBZNSVQgTGluY29sbiBMYWJvcmF0
b3J5MQwwCgYDVQQLDANQS0kxEzARBgNVBAMMCk1JVExMIENBLTUwHhcNMjEwNDI4MTgwMzU1WhcN
MjYwMzAyMjM1OTU5WjBoMQswCQYDVQQGEwJVUzEfMB0GA1UEChMWTUlUIExpbmNvbG4gTGFib3Jh
dG9yeTEPMA0GA1UECxMGUGVvcGxlMScwJQYDVQQDEx5DaHJpc3RpYW5zZW4uRWR3YXJkLkouNTAw
MDU2MzQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDdCEdq4aXCi5leaDSfcCyEPz54
CsUzYljGpBwycKWAEgqRp/88YT/QQN1ikJRAdlCJpN4rJwmuW0/p6tU9nezpmU7/z09yivcF5yRb
4cSvRp+j42+Rgd5zQN3eC6aGren9iIOVpxAuvxDUnhWc8G8mWmYz/PSwF3bxtghuOmGMZiC+bSsh
v3JTK54t1iCe5c4lbYxstOhQQe/nPv7TH+ACaaX2xITLp6m/KXFKUMsur5z55pgyZP6hAvPMNa6/
MTtWcKkhG1QUKO6qYlSeiXer5kpSpmuxuZDNrEHIkQtq6DaArHS84cbNN6U/76VPDJNxduvdOpQj
XSvGNyS2sKtHAgMBAAGjggG2MIIBsjAdBgNVHQ4EFgQUbtxlegynIuGNAXL7/iOL/4YEZ2IwDgYD
VR0PAQH/BAQDAgbAMB8GA1UdIwQYMBaAFC/vu8YNHbvpav6sZ/MHOwh29ktZMDMGA1UdHwQsMCow
KKAmoCSGImh0dHA6Ly9jcmwubGwubWl0LmVkdS9nZXRjcmwvbGxjYTUwZgYIKwYBBQUHAQEEWjBY
MC0GCCsGAQUFBzAChiFodHRwOi8vY3JsLmxsLm1pdC5lZHUvZ2V0dG8vbGxjYTUwJwYIKwYBBQUH
MAGGG2h0dHA6Ly9vY3NwLmxsLm1pdC5lZHUvb2NzcDA9BgkrBgEEAYI3FQcEMDAuBiYrBgEEAYI3
FQiDg+Udh+ynZoathxWD6vBFhbahHx2Fy94yh/+KcwIBZAIBCjAiBgNVHSUBAf8EGDAWBggrBgEF
BQcDBAYKKwYBBAGCNwoDDDAdBgNVHREEFjAUgRJlZHdhcmRjQGxsLm1pdC5lZHUwGAYDVR0gBBEw
DzANBgsqhkiG9xICAQMBCDAnBgkrBgEEAYI3FAIEGh4YAEwATABVAHMAZQByAFMAaQBnAC0AUwBX
MA0GCSqGSIb3DQEBCwUAA4IBAQAKsjiCo2KX3I8f1O94A5IoPEZ570cjAPkOVbLyQ5C6W5uKW3ja
vOc8xYxwAx5TUwZUmbmgOlEKpTyInEI2XZh4+ofXgkmzrNRpS3ObOnAP9jk8/H7BB7Zx6hfMwmUZ
3UGyyfRmo2dDgiT/CSmeWCDAZkZAZxXMEJ5jkzPLmX4IBSYMZxDgyjkC7u7J+lGdy+yJh6YUvnc0
SH5HO2QHZ5uxvXuBQGir+f35lGbYaGrEDfbwPqo9xCyViv6ivFyqe9WF5j8xnUZjLqV4QlkuY+EM
Ez5UtpYGQ/JFM39Yw9UqEDI6Zil5xg9cv2Gfy1jVS2WlTMSVTqEL7T98ICfconC8MIIFATCCA+mg
AwIBAgITWQAFHELZZpoLlk7+ZAAAAAUcQjANBgkqhkiG9w0BAQsFADBRMQswCQYDVQQGEwJVUzEf
MB0GA1UECgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECwwDUEtJMRMwEQYDVQQDDApN
SVRMTCBDQS01MB4XDTIxMDgwMzEzMDYyMVoXDTI2MDMwMjIzNTk1OVowaDELMAkGA1UEBhMCVVMx
HzAdBgNVBAoTFk1JVCBMaW5jb2xuIExhYm9yYXRvcnkxDzANBgNVBAsTBlBlb3BsZTEnMCUGA1UE
AxMeQ2hyaXN0aWFuc2VuLkVkd2FyZC5KLjUwMDA1NjM0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAveg/nnrZNP+vdsWKYlSg0FX0rGTPsYz7tVcH2uHQOZmbWtaxoM635H3vQdYd9u8r
oxn7avXkZ2jmjvQgZ4L0lWDfS6paMa2F+YXoDo6PwT+hiyHIungk1J2E23aDK9axVEbMT8/+la/f
8+Y+UsQ/G2883HgjtlCa/ACoJICNhWtLRw60V2NjnldmcphcyG1zoUBL9ahgWDJWouT1P2IU/w+o
Ki7rw0N1VnpzCMSiYY+yQYeh1IvrL2mAICICXuoLSL88fjrI69x3t0UHdux9Gle5OxRXgmlKovqk
nISuygB5CJJQeyZ9JEUaUr/W53rqzpJRJefq17aoSpUOCpC6RwIDAQABo4IBuTCCAbUwHQYDVR0O
BBYEFEzRVcafiLXoUE35e5g7UJ3wjp8IMA4GA1UdDwEB/wQEAwIFIDAfBgNVHSMEGDAWgBQv77vG
DR276Wr+rGfzBzsIdvZLWTAzBgNVHR8ELDAqMCigJqAkhiJodHRwOi8vY3JsLmxsLm1pdC5lZHUv
Z2V0Y3JsL2xsY2E1MGYGCCsGAQUFBwEBBFowWDAtBggrBgEFBQcwAoYhaHR0cDovL2NybC5sbC5t
aXQuZWR1L2dldHRvL2xsY2E1MCcGCCsGAQUFBzABhhtodHRwOi8vb2NzcC5sbC5taXQuZWR1L29j
c3AwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIg4PlHYfsp2aGrYcVg+rwRYW2oR8dhevQcIPr
7SACAWQCAQswJQYDVR0lBB4wHAYEVR0lAAYIKwYBBQUHAwQGCisGAQQBgjcKAwQwHQYDVR0RBBYw
FIESZWR3YXJkY0BsbC5taXQuZWR1MBgGA1UdIAQRMA8wDQYLKoZIhvcSAgEDAQgwJwYJKwYBBAGC
NxQCBBoeGABMAEwAVQBzAGUAcgBFAG4AYwAtAFMAVzANBgkqhkiG9w0BAQsFAAOCAQEAECYa1Q/x
E7jaGWUFqlt/jHafeZka4WxG26s8ySz+wLyDPAPbADmV3nxtqFwqrS4QNGM0t5QLCoN12QlLR2HL
Vk4/Z7eKmsLhj65MY3FmTVBeu74SpDeR1jHxXvoI9NYZ/nXrySn3c2JOx/I1D6glK5NB/fzzwVzA
YlpSVPguTA8rp/uUluHHknkjrv+t9FHjUHcEl+t+UqQyR7LS7wl7Kd508gSKdJnWyukV9zDlulKh
eFAKdIVFeLrr3JleMWUrVE3NX9B7JMrbZcqU/vEVQx6dKPsCi/KOfiYorxUpTCOeSV8RuM/2HHgR
H+actZizpOzaehROESyjXnXgZztSFjGCA4owggOGAgEBMGgwUTELMAkGA1UEBhMCVVMxHzAdBgNV
BAoMFk1JVCBMaW5jb2xuIExhYm9yYXRvcnkxDDAKBgNVBAsMA1BLSTETMBEGA1UEAwwKTUlUTEwg
Q0EtNQITWQAFDeB4a6v0/8PFRwAAAAUN4DANBglghkgBZQMEAgEFAKCCAfMwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzIwMTMwNDEwWjAvBgkqhkiG9w0BCQQx
IgQg+zh5UIc62+EEJOjPzRESuePmQvxic7fMoGWcu88XsDgwdwYJKwYBBAGCNxAEMWowaDBRMQsw
CQYDVQQGEwJVUzEfMB0GA1UECgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECwwDUEtJ
MRMwEQYDVQQDDApNSVRMTCBDQS01AhNZAAUcQtlmmguWTv5kAAAABRxCMHkGCyqGSIb3DQEJEAIL
MWqgaDBRMQswCQYDVQQGEwJVUzEfMB0GA1UECgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoG
A1UECwwDUEtJMRMwEQYDVQQDDApNSVRMTCBDQS01AhNZAAUcQtlmmguWTv5kAAAABRxCMIGTBgkq
hkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglg
hkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAsGCWCGSAFlAwQCATALBglg
hkgBZQMEAgMwCwYJYIZIAWUDBAICMAcGBSsOAwIaMA0GCSqGSIb3DQEBAQUABIIBAAKT5l+AXcuS
ZIQ7mAviqK6nsnnwicLKHLWgRnqlYsfbBHAbdJ+XosvMrzKxvJ05UR406EIq3Qfhu1yuRzIdVgqa
AQt3O4LKo/sqxOCl83wOeiMK9DcWZpcOZ+nbH4sGy0Y70FbBk1jqls3vttYsDHSNRLS61X9k7jfW
gJyaFW4GYC3nyiKeHm3wx1PNifmukDdeDOlrwlZUHkEN7hwELG5geoOoxvIF6VQZ1MK2KXImkpTu
+GiCgTC+sQC3uvLllEwtguBLjZdldeM1RdJAeSXPOTjBsR84M+Vlmtuyw3Vv1ksarDiLhm6nakyV
2MR1MjL0bxTow48rxyz4uU5ab8kAAAAAAAA=
------=_NextPart_000_000D_01D95B0A.EF4271D0--

--===============3533318773064441585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============3533318773064441585==--

