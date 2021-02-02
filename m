Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC3B30CE51
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:57:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-sSUiKWVSOl-Nw7AZEaJ2WQ-1; Tue, 02 Feb 2021 16:57:51 -0500
X-MC-Unique: sSUiKWVSOl-Nw7AZEaJ2WQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB0481622;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088A87EA99;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF3FD50039;
	Tue,  2 Feb 2021 21:57:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LiClT017438 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:44:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47B1F2166B2A; Tue,  2 Feb 2021 21:44:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 407092166B27
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:44:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A42448115B0
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:44:08 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com
	[173.37.142.93]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-454-LcYYMS61OUuxeFRb-1roZg-1; Tue, 02 Feb 2021 16:44:06 -0500
X-MC-Unique: LcYYMS61OUuxeFRb-1roZg-1
X-IPAS-Result: =?us-ascii?q?A0CcAwCDxhlgmIYNJK1iHgEBCxIMQIMiKSh9WjIxCgGHf?=
	=?us-ascii?q?QOODo9yFokRglMDVAsBAQENAQEjCgIEAQGESgKBfAIlOBMCAwEBAQMCAwEBA?=
	=?us-ascii?q?QEFAQEBAgEGBBQBAQEBAQEBAYY2DYVzAQEBBDoGAQE3AQ8CAQgVAx4QFB4nB?=
	=?us-ascii?q?A4FgltLAYJVAy4BDqUaAooldIE0gwUBAQaBMwGDWxiCEgMGFIEkgneKbhuBQ?=
	=?us-ascii?q?T+EKj6CXQECgV4ygxuCLIQDAoFMeZJwiCedWwqCeJtzMQ+jDbYdAgICAgQFA?=
	=?us-ascii?q?g4BAQaBbSGBWXAVgyRQFwINjiEaHYM6ilh0AjUCBgoBAQMJfIoIAYEQAQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3Au1d8Whc0aqb8whVZ451oqj/PlGMj4e+mNxMJ6p?=
	=?us-ascii?q?chl7NFe7ii+JKnJkHE+PFxlwaTAdfD4u9Azu/RtLrtH2cH5MXJvHMDdclKUB?=
	=?us-ascii?q?kIwYUTkhc7CcGIQUv8MLbxbiM8EcgDMT0t/3yyPUVPXsqrYVrUry6q5CMWXx?=
	=?us-ascii?q?D4MhB4YO/yH92ag8G+zevn/ZrVbk1Bjya8ZrUnKhKwoE3Ru8AajJEkJLw2z0?=
	=?us-ascii?q?7Co2BDfKJdwmY7KA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,396,1602547200"; d="scan'208";a="679837992"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	02 Feb 2021 21:44:05 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 112Li5Kw019149
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Feb 2021 21:44:05 GMT
Received: from xfe-rcd-003.cisco.com (173.37.227.251) by XCH-RCD-001.cisco.com
	(173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 2 Feb 2021 15:44:05 -0600
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by xfe-rcd-003.cisco.com
	(173.37.227.251) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
	Tue, 2 Feb 2021 15:44:05 -0600
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-001.cisco.com (173.37.227.246) with Microsoft SMTP Server
	(TLS) id
	15.0.1497.2 via Frontend Transport; Tue, 2 Feb 2021 15:44:04 -0600
Received: from SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
	by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17;
	Tue, 2 Feb 2021 21:43:58 +0000
Received: from SJ0PR11MB5037.namprd11.prod.outlook.com
	([fe80::f5b5:4b05:475a:f82c]) by
	SJ0PR11MB5037.namprd11.prod.outlook.com
	([fe80::f5b5:4b05:475a:f82c%7]) with mapi id 15.20.3784.016;
	Tue, 2 Feb 2021 21:43:58 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 1/2] audit: show user land backtrace as part of audit
	context messages
Thread-Topic: [PATCH 1/2] audit: show user land backtrace as part of audit
	context messages
Thread-Index: AQHW+ayD0lMF6lgWmUKFQjEuERA8dQ==
Date: Tue, 2 Feb 2021 21:43:58 +0000
Message-ID: <20210202214357.GD3710@zorba>
References: <20210202212930.18845-1-danielwa@cisco.com>
	<CAHC9VhShkEJHWmuE2C_RLQy-Z3CpvAhTj68ki22v=AKF5hfvrQ@mail.gmail.com>
In-Reply-To: <CAHC9VhShkEJHWmuE2C_RLQy-Z3CpvAhTj68ki22v=AKF5hfvrQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [128.107.241.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 804d5706-7ccc-4304-b10c-08d8c7c3a599
x-ms-traffictypediagnostic: SJ0PR11MB4847:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4847A426E4716B2AAEF46B40DDB59@SJ0PR11MB4847.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: pGdUec0yWy3k7gjdqs27l+SSycT/1sgXVQxMMioK9pDIrDtBLGbKLLNrfqkKlSFr4IKuuezCXWWl98rUbcDmEgrGT5at1dgO8NCkJZDmU2qwt1fqeVyYUuf2nOlyeGbGzcDWL1m1NNLKveCcJHaNFE6oc0eG0+shNBpIP8spuTbvZXoNfnEtWm19cmdfxDwcsSKq+2J4+Fuq0D5fo4gly/VJjWTtDiyFbEw7Tjkd8FUxzmvYI+Tpc2rfQRf34bloFfIude0DOxAwaxT0EPm4VT4HVmd7qtzg5/Z4P4RutN4J8bEhvZJz0XpOyho/9sGrmdx6DAS8I9dI9tR0NfCHJ8z0mlPmnHoxhOba+e1BFE62cVD/qDrIRTf9iXlyaY+X/fxSq/OKi0xsBjaakQrZN5bQCm4w6zcAMnU+jvfH3fsfoFcYkHuMWylMXdo861bWXcrDH55jeKwTPhhT7gpsceaQFSSaH6Ai5fAXvHB70Iq8mlnn+/8BD1WlqwJFpucbzyXyx5uX8IA0yPpeJN40lsa/gYO39os/VZOsYbDIYhe7VynKzkmtkI6g5Lflk/G+J9hdTaFyzIq0Jgg6S/eOONfoHN1lVP4Uw0jbFI6soZY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR11MB5037.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(7916004)(376002)(366004)(396003)(39860400002)(346002)(136003)(186003)(8676002)(15650500001)(2906002)(86362001)(6486002)(33656002)(83380400001)(26005)(966005)(6506007)(71200400001)(8936002)(53546011)(478600001)(33716001)(5660300002)(316002)(64756008)(54906003)(4744005)(66446008)(66556008)(1076003)(66946007)(66476007)(4326008)(9686003)(6512007)(6916009)(76116006);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oqwwRIWhruAhsFEJ0L1KVvav4DtizILkNXq72ez0e6m0dbqHChQkPqfIYYdn?=
	=?us-ascii?Q?ElWQwQgD/eIdXkU5ysPrUaP6SQCdKWEiSUjd8xJivnRM4JN2plpTnTvOfXVY?=
	=?us-ascii?Q?4cfvXV0+7Pn9TJlccDP91XuHl9pk7g5j4HdgkU04nf2A3blAcDOz2oVO7XPt?=
	=?us-ascii?Q?HVtZvxqbH9Ht+uQCCznYRIe+IO0DCdaKWZV3/Aa/N04Fu6HuXd60xBah2eol?=
	=?us-ascii?Q?ip928uYrh9k8hXVJibYEEQGnNRzq2cfmN7D8/HjLeGDFIBGYr70KbS+u3f3V?=
	=?us-ascii?Q?wARybEP39UpLdWZIfORqyJJ4PK6CXxqMGNwxU7vjVdEkJModeVmGdrIugDnO?=
	=?us-ascii?Q?RQuy/R3RtzD2LlpvOWD/I/tYkonFvu1PLR7A3whT3dk7f1hbNrQKcrZtDMRj?=
	=?us-ascii?Q?VsFEVjkLD/6mzQtRbX7wThxbOL1cu1NbHn03IbRKmWvOpEm1cngkYoOU/Dsf?=
	=?us-ascii?Q?Axm9Mpp6n1ztbjIpcuyQSmsNL3mbHXfa8FiEPHfnvJktqers2dIQdtryytpR?=
	=?us-ascii?Q?Ydf3+7ZpBYcLIczd2n5gXCWznIKJ34iwwR9+ZQJYniJchbTE9nPN9MUDdr1Q?=
	=?us-ascii?Q?ainYxjQ5MBY3FWVwYTtBArR3+1q6zWQiDs7qtC0rrI1UEbN/hydHHv+fBv3g?=
	=?us-ascii?Q?zrkMzWISLrUr3NJj4dm0GSAb2dIsxJrviYlYhgM3xepgKyMA+sS0Lb7GXBNC?=
	=?us-ascii?Q?wJdMkaTs0kN2/d8RtEh+h4vYr0yoXMUwKyrDZeHUBxKCWViR5u/lEM/BFY3x?=
	=?us-ascii?Q?U+hLehXvuOElaFvZEzqChG2uFWf4GHzX001nq6KaWYpjKXnWA4c54u3dq36q?=
	=?us-ascii?Q?YedjbD8GadagF2JOLhuFXQ5DunajeUzittrf1Sa6jtAPxx5Je+Yd6M/IovM2?=
	=?us-ascii?Q?P0Sz6h0QOv7KCjBY3nH4+h+G5YG4HJsfRgFL8gSul4y7jFSK1/Mhjjl+mLX/?=
	=?us-ascii?Q?PYOvCoipoxE5IR9tPHgPeZbvmWOSbjPfs6p+/VbBcD3p6T0ahfupRY4Bbau7?=
	=?us-ascii?Q?21TkDQ4x0zPK7Sqsh/Id2tdWhgHy7O6aWYMFwVk/o1GNa3KNoDWhFFwEULi7?=
	=?us-ascii?Q?AJdzDTB1G4CsuXFkOM4TYBgy/C4w1Q=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804d5706-7ccc-4304-b10c-08d8c7c3a599
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 21:43:58.2872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzXvSojhuXe9gZRm/OMSqo286O3XVquphcORzXauxbEAPlAswOCZFKE511drcLgIj8ngYJT7qvwJS3U66mliVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 112LiClT017438
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 02 Feb 2021 16:57:02 -0500
Cc: "Victor Kamensky \(kamensky\)" <kamensky@cisco.com>,
	"Ruslan Bilovol -X \(rbilovol - GLOBALLOGIC INC
	at Cisco\)" <rbilovol@cisco.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <94C27F14C2310741B4EB9CF84B24D366@namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 02, 2021 at 04:35:42PM -0500, Paul Moore wrote:
> On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> > From: Victor Kamensky <kamensky@cisco.com>
> >
> > To efficiently find out where SELinux AVC denial is comming from
> > take backtrace of user land process and display it as type=UBACKTRACE
> > message that comes as audit context for SELinux AVC and other audit
> > messages ...
> 
> Have you tried the new perf tracepoint for SELinux AVC decisions that
> trigger an audit event?  It's a new feature for v5.10 and looks to
> accomplish most of what you are looking for with this patch.
> 
> * https://www.paul-moore.com/blog/d/2020/12/linux_v510.html

We haven't tried it, but I can look into it. We're not using v5.10 extensively
yet.

Daniel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

