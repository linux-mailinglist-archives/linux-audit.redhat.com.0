Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D6051254BAD
	for <lists+linux-audit@lfdr.de>; Thu, 27 Aug 2020 19:10:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-KwThzg5NNcKe7iWrzUuoLQ-1; Thu, 27 Aug 2020 13:10:32 -0400
X-MC-Unique: KwThzg5NNcKe7iWrzUuoLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D106318BA286;
	Thu, 27 Aug 2020 17:10:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D51E9757DC;
	Thu, 27 Aug 2020 17:10:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF5E8668E1;
	Thu, 27 Aug 2020 17:10:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RGfJQ5001008 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 12:41:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B4BF115D7AE; Thu, 27 Aug 2020 16:41:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2592E115D7AC
	for <linux-audit@redhat.com>; Thu, 27 Aug 2020 16:41:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD4E3101AA40
	for <linux-audit@redhat.com>; Thu, 27 Aug 2020 16:41:16 +0000 (UTC)
Received: from illinois.edu (relays-agent08.techservices.illinois.edu
	[204.93.2.8]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-1jBGPeWbN0WsJ3Q8DXePnA-1; Thu, 27 Aug 2020 12:41:10 -0400
X-MC-Unique: 1jBGPeWbN0WsJ3Q8DXePnA-1
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam04lp2052.outbound.protection.outlook.com [104.47.44.52])
	by relays-agent08.techservices.illinois.edu (8.16.0.42/8.16.0.42) with
	ESMTPS id 07RGPjaT019680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 27 Aug 2020 11:25:45 -0500
Received: from DM6PR11MB3739.namprd11.prod.outlook.com (2603:10b6:5:13b::10)
	by DM5PR11MB1884.namprd11.prod.outlook.com (2603:10b6:3:112::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25;
	Thu, 27 Aug 2020 16:25:44 +0000
Received: from DM6PR11MB3739.namprd11.prod.outlook.com
	([fe80::455e:16cc:fc27:7d60]) by
	DM6PR11MB3739.namprd11.prod.outlook.com
	([fe80::455e:16cc:fc27:7d60%7]) with mapi id 15.20.3305.031;
	Thu, 27 Aug 2020 16:25:44 +0000
From: "Paccagnella, Riccardo" <rp8@illinois.edu>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: [RFC] Tamper Evident Logging on Linux Audit
Thread-Topic: [RFC] Tamper Evident Logging on Linux Audit
Thread-Index: AQHWfI62KS4/5+wcQ0+B4OR0bXylCA==
Date: Thu, 27 Aug 2020 16:25:44 +0000
Message-ID: <B257B8BE-4B7F-42BE-BD84-155406FF3FC3@illinois.edu>
Accept-Language: en-US, es-ES, it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [66.253.183.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40c22a51-28b9-4b95-a5f3-08d84aa5d926
x-ms-traffictypediagnostic: DM5PR11MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1884AB09A2709A9BD694085381550@DM5PR11MB1884.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5On/p4sCR5pmQylr/7PWjX9GmIP7KOiAgVorBLPpM1CAp52h9mAmThi3RrmbN4By8Nmbe5BrLr4RbOnfykr7VDdIki8vDOi1x6SpVfjU+hTTEFL3pFVT/IV0TV6ZI5yHIERwqL9s0VIRsdRuQyrKdMLrVNXg+SY2k5RKLc9jCLqQ9k6JaFBRi+RIhaJkcdm99QiDPuyrbQWVlabKpRtmH9xfNIJ9YFOJ49Z6N5GedidaI/LO703NLZ9epe/HAWzF0RU7U2drpalZw/7wkPeG/fPADPWdFMqC+UgUGcgZ/im9gy74dHWd7Z9oi6gv+4exMlzyd3nWUP2A7TIDyuaTg/8V3y5eYDBP2uC74iPQF6owloKVc3eY6Qy/U/4Re7/GOjwQZ2ZgbUVEqdYRCh61Lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM6PR11MB3739.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(376002)(396003)(346002)(136003)(366004)(76116006)(36756003)(316002)(8676002)(5660300002)(4744005)(33656002)(6916009)(71200400001)(26005)(6486002)(4326008)(786003)(2906002)(91956017)(66946007)(64756008)(83380400001)(8936002)(6512007)(66446008)(66476007)(86362001)(66556008)(166002)(478600001)(54906003)(6506007)(2616005)(75432002)(186003);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: /4dXLz7Mb9/894e7/ig/YecX4Yv0p+1+TXyBVBbkkhhEZBk65w5nTS/dGXl8+v3CtGdVbysnMtD/QSEd/cMO6wTBpLksXt2gYnXQNwm3BnUgBjstHPmOx8/jOeHb/iij1+cY4Jd0cEIYZU5yv3f2VUwzAtA/+8CGVDfs7M3xW+8sz+U0C4kPwC5f9lCx3+u8LL872MCmxxAIYZ/VfynW0c6tn7KC88RZHVcmc9fEH5RdKrmadSFi8PMJnNktIIu8NKKDUPaHo8itXPQPF6oiJxX1W3apXEboszFZLArmq6nuOvBmm9cF5+HViNNeDqjTyMt2YeBi8YAbAFk/YgPG85/O07SBEh4jQ6HQjsi9ySqYvs8xm7zaBklxO6TX9BttxmHef0U/16k+pXiCy4nc9ekHfKkzzjUQRarRaWN6mu5u3gSGCCCRjcbBHY8BC3GmxlTrEFVXvDItz7N27oOgXEBMH97NMVx3sG1MPwdl6H88MqMOl5UMZzMU6TzpihX058NeLLIV0te3vFE8+Sx0OkO05Ken8iJhzrPWpbeYc4QXBerZrscEp3LhkyY5h5ahwlrdqnuzPhp+GRVGUfDcCXRZaJOVuGVN9HqPixgrelrZsWwqrK63kxKXS6wnOoICDQQIceUDbkgdnREwtgIwCg==
MIME-Version: 1.0
X-OriginatorOrg: illinois.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c22a51-28b9-4b95-a5f3-08d84aa5d926
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 16:25:44.5283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 44467e6f-462c-4ea2-823f-7800de5434e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFfK0CNW/kj6lkD4ZdLXI3C1pq68kVhrw7k8oReTUBuZ8pzaDz85qOVRrCmoEBx38i81FppXTHVB9SkRy3jTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1884
X-Spam-Details: rule=cautious_plus_nq_notspam policy=cautious_plus_nq score=0
	malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=809
	priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
	clxscore=1011 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2006250000
	definitions=main-2008270120
X-Spam-Score: 0
X-Spam-OrigSender: rp8@illinois.edu
X-Spam-Bar: 
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 27 Aug 2020 13:10:08 -0400
Cc: "rgb@redhat.com" <rgb@redhat.com>, "Dave \(Jing\) Tian" <daveti@purdue.edu>,
	"Liao, Kevin" <kliao6@illinois.edu>, "Bates, Adam" <batesa@illinois.edu>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6092640705288335058=="
Content-Language: en-US

--===============6092640705288335058==
Content-Type: multipart/alternative;
	boundary="_000_B257B8BE4B7F42BEBD84155406FF3FC3illinoisedu_"
Content-Language: en-US

--_000_B257B8BE4B7F42BEBD84155406FF3FC3illinoisedu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Linux Audit Team,
  My team and I would like to share with you some recent research results t=
hat we hope will be interesting to you. In a nutshell, we designed a kernel=
-based tamper-evident logging system and implemented a proof of concept of =
it on top of Linux Audit. Would you be interested in the possibility of inc=
orporating our system in the upstream version of Linux Audit? We envision a=
 small extension to Linux Audit that would allow users to enable integrity =
protection for the logs if desired. For reference, this<https://rp8.web.eng=
r.illinois.edu/papers/kennyloggings-ccs2020.pdf> is our paper and this<http=
s://bitbucket.org/sts-lab/kennyloggings/> is our proof-of-concept implement=
ation.

Thanks very much in advance and best regards,
Riccardo

--_000_B257B8BE4B7F42BEBD84155406FF3FC3illinoisedu_
Content-Type: text/html; charset="us-ascii"
Content-ID: <DB30EF20A9E85F429C48B2F390B9B400@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Dear Linux Audit Team,<br class=3D"">
&nbsp;&nbsp;My team and I would like to share with you some recent research=
 results that we hope will be interesting to you. In a nutshell, we designe=
d a kernel-based tamper-evident logging system and implemented a proof of c=
oncept of it on top of Linux Audit. Would
 you be interested in the possibility of incorporating our system in the up=
stream version of Linux Audit? We envision a small extension to Linux Audit=
 that would allow users to enable integrity protection for the logs if desi=
red. For reference,&nbsp;<a href=3D"https://rp8.web.engr.illinois.edu/paper=
s/kennyloggings-ccs2020.pdf" class=3D"">this</a>&nbsp;is
 our paper&nbsp;and&nbsp;<a href=3D"https://bitbucket.org/sts-lab/kennylogg=
ings/" class=3D"">this</a>&nbsp;is our proof-of-concept implementation.<br =
class=3D"">
<br class=3D"">
Thanks very much in advance and best regards,<br class=3D"">
Riccardo<br class=3D"">
</body>
</html>

--_000_B257B8BE4B7F42BEBD84155406FF3FC3illinoisedu_--

--===============6092640705288335058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6092640705288335058==--

