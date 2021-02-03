Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 52E9430E3DF
	for <lists+linux-audit@lfdr.de>; Wed,  3 Feb 2021 21:10:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-rzgfLOTGMR-mdLsToFxrEw-1; Wed, 03 Feb 2021 15:10:20 -0500
X-MC-Unique: rzgfLOTGMR-mdLsToFxrEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1349A8030BC;
	Wed,  3 Feb 2021 20:10:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F3A1F445;
	Wed,  3 Feb 2021 20:10:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5187A18095CB;
	Wed,  3 Feb 2021 20:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113JBw61002608 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 14:11:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47300200A799; Wed,  3 Feb 2021 19:11:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB6A2026D11
	for <linux-audit@redhat.com>; Wed,  3 Feb 2021 19:11:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33325811E87
	for <linux-audit@redhat.com>; Wed,  3 Feb 2021 19:11:55 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com
	[173.37.142.92]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-489-DRNSyCZHOeWQK9dd07mWnA-1; Wed, 03 Feb 2021 14:11:51 -0500
X-MC-Unique: DRNSyCZHOeWQK9dd07mWnA-1
X-IPAS-Result: =?us-ascii?q?A0BRAwAW8xpgmIUNJK1iHgEBCxIMQIMiUYFXMjGEQINIA?=
	=?us-ascii?q?44MA5kZglMDVAsBAQENAQEtAgQBAYRKAheBZQIlOBMCAwEBAQMCAwEBAQEFA?=
	=?us-ascii?q?QEBAgEGBBQBAQEBAQEBAYY2DYVzAQEBBCMRDAEBNwEPAgEIFQMCAiYCAgIwF?=
	=?us-ascii?q?RACBAENBRmDDYJWAy4BphgCiiV2gTKDBQEBBoUiGIISCRR6KoJ3hAaGQiYbg?=
	=?us-ascii?q?gCCJYIFPoQ+F4MCgmCBWWsHgQ9LAoEqNjcsD49Ag0OKeJpPCoJ6nAIioyCUM?=
	=?us-ascii?q?qFzAgQCBAUCDgEBBoFtIYFZcBWDJFAXAg2OIQwOCYNOill0NwIGCgEBAwl8i?=
	=?us-ascii?q?xkBAQ?=
IronPort-PHdr: =?us-ascii?q?9a23=3AO9rKKRy/nZQxw6PXCy+N+z0EezQntrPoPwUc9p?=
	=?us-ascii?q?sgjfdUf7+++4j5ZRWDt/5sl1TOG47c7qEMh+nXtvXmXmoNqdaEvWsZeZNBHx?=
	=?us-ascii?q?kClY0NngMmDcLEbC+zLPPjYyEgWsgXUlhj8iKwMFNeH4D1YFiB6nG35CQZTx?=
	=?us-ascii?q?P4Mwc9L+/pG4nU2sKw0e36+5DabwhSwjSnZrYnJxStpgKXvc4T0oY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,399,1602547200"; d="scan'208";a="657289183"
Received: from alln-core-11.cisco.com ([173.36.13.133])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	03 Feb 2021 19:11:50 +0000
Received: from XCH-RCD-004.cisco.com (xch-rcd-004.cisco.com [173.37.102.14])
	by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 113JBnVU005666
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Feb 2021 19:11:49 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-RCD-004.cisco.com
	(173.37.102.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 3 Feb 2021 13:11:49 -0600
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xhs-rtp-002.cisco.com
	(64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 3 Feb 2021 14:11:48 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server
	(TLS) id
	15.0.1497.2 via Frontend Transport; Wed, 3 Feb 2021 13:11:48 -0600
Received: from BYAPR11MB2744.namprd11.prod.outlook.com (2603:10b6:a02:c8::10)
	by BY5PR11MB3958.namprd11.prod.outlook.com (2603:10b6:a03:18e::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17;
	Wed, 3 Feb 2021 19:11:45 +0000
Received: from BYAPR11MB2744.namprd11.prod.outlook.com
	([fe80::1831:4b15:d094:806]) by BYAPR11MB2744.namprd11.prod.outlook.com
	([fe80::1831:4b15:d094:806%7]) with mapi id 15.20.3805.024;
	Wed, 3 Feb 2021 19:11:45 +0000
From: "Phil Zhang (xuanyzha)" <xuanyzha@cisco.com>
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>, "paul@paul-moore.com"
	<paul@paul-moore.com>
Subject: Re: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Topic: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Index: AQHW+aqHV28JclAf1k2Lsv3wiLeyMKpFZeuAgAFjeACAAAQaAA==
Date: Wed, 3 Feb 2021 19:11:45 +0000
Message-ID: <07df653066640842400c07aa7a06a0cfc592a854.camel@cisco.com>
References: <20210202212930.18845-2-danielwa@cisco.com>
	<CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
	<20210203185700.GK3710@zorba>
In-Reply-To: <20210203185700.GK3710@zorba>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1
x-originating-ip: [2001:420:c0c8:1006::87f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b91d192-d506-4b15-490c-08d8c8778c64
x-ms-traffictypediagnostic: BY5PR11MB3958:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB39587A6522A0D52086DDC58FC8B49@BY5PR11MB3958.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 4RIf1lu+wo9S1czfB/5TXTzSn4SQkuwZQF03f7a5VJPNYltLyG/3QzDxinQczT+pd925M0oHIPDteOfW/8lymwSpgA6VweiltlloyHv0GC+fXd/zTarL8CpUXlgmo/AcVA78AAnLm5cZwSPOKGyJJiOAoITdDXbdlB6DJaMTkmKY00NSXvGEr95o97lLAy+VjbAbE85uuYPlOtUeDhkPMaQgzTuq1qkcxqfdKfks+2J06NDarLvRrUKgAiB/LTfTsCSplURDhFHMAsIWjav0v0MJtGKn4K3HkzXq4S2E5VeL7/zOsTIpHq4BHvuY7wzBy2J8XtwGZdPkoERSRGtMHSRDwiUdxZEoMxhOqoKvshS/3Ejbf/iiSwq0k1PVTEd69giYBf/e38aD5O0JUKkl91VOiolOc/qBp8qSp+8kp2/Y4ad5/mzRigzh3mrT5rFfX6KmJ88A1kq9W9o6YopnVvu8OoY5/0C6xQavOw0QlAE+V8tfJHu90yErzpOvLyqsFnCYL2U2jarJngcXFgRDLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR11MB2744.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(376002)(136003)(396003)(39860400002)(366004)(478600001)(66446008)(64756008)(53546011)(107886003)(5660300002)(2906002)(2616005)(186003)(36756003)(4326008)(6486002)(66476007)(66556008)(8676002)(6506007)(110136005)(316002)(71200400001)(54906003)(83380400001)(86362001)(6512007)(76116006)(8936002)(66946007);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?utf-8?B?OHVyc0FvS1YwZk5DQUs5R0Uvd2FHOTF2MHFhUzMvcE1zUlIxYWt1RDh4K1dn?=
	=?utf-8?B?NVkyRnlSbW1aOWxSL0tIcnFiWXRHdEVhcmhTMjJXNDhFNmpVeUoxRWh4ZmVh?=
	=?utf-8?B?dXZNbmZ2K3l3R1BFV25PYnhzVjVIYXRYNnJ5ekhDQVd5WDFCYWZtMnN2OEcx?=
	=?utf-8?B?QTdVVFJIMFErR1FxdUVXeTVUb3lWOFJ3U2k5dXBlZHdORVE4Y3p5bjYwTXI1?=
	=?utf-8?B?SWRRY0JINWthQ1JQV2IwM3Z6Y2J3cXQ1OUtLMjNYdUhsY1VoN2J0TEhjbVZ4?=
	=?utf-8?B?cHA1amJxR2JzeW1ZZm1uR3ErSkxPUkJYVWUwNUk3dVdJTVZmZUxwcm5oS3dh?=
	=?utf-8?B?dGxOT0dGZlUxSlMwdFlUTGF2VjJGWWtPUGQ2dDZtbXhON1JrVkw0M1pselNI?=
	=?utf-8?B?VmhLem1mUm1ISitnVjB4MGpCaGxMMmxXSHhRM1pUaWoxQzlDR2d1ZUZjNWpM?=
	=?utf-8?B?MmRMYzVxaUplbWk2b1BrbDR6cS9NUkdvNk5ueGJvcUhJNmptaFphZjBucDJH?=
	=?utf-8?B?bmtsMHUvV3dQZFdmY0lrTHRtNVJ1RHhwNUJkMFcxeWRaYU5PdEJMMnJETC95?=
	=?utf-8?B?V2F6RDlNM0Y4cFEwSU9GcDZyYk1mcjlNejJIZzJqQ21HS08wdE8rWUxYK1NW?=
	=?utf-8?B?S21Gc3gxMWIwZ2hoejlGbk03Z21mU3NXMlZ6NWtaY0NDNE05QWQzL2V5S0J6?=
	=?utf-8?B?V3M4K1pzMEwybXBCRXJUYXAvNW5xdWR5ckUwS2prVllodjBVVW5Gck9tR3cx?=
	=?utf-8?B?MUc3QnhOMTQ5VEkxVFF5QmxHWFBGUTN0MldTdG1IU051NFA5aS9jVUFGRlJB?=
	=?utf-8?B?c04xMjhWTENRYnNBcXZEaEdTWDNYS1Q3bFVsVHoxbVB2Y2NMY1QyWDRWcE9P?=
	=?utf-8?B?SCtSa0NjZTQrd09XWHh1ditDaE9ONTZ6b3BjMHdqbHpOdWRTV1crdTRFakdh?=
	=?utf-8?B?V1BVVVNISS9wcythZHdoQ2NxNk1ubGtSZExqRTgreCtINkt5KzVjaUNyUlJQ?=
	=?utf-8?B?dHgybEp1b0U1aExBeVB4SlFiVDBDQ0xET1U1R2wzZTFQOG1nZFArR0RmRzlF?=
	=?utf-8?B?SmhUZHFyVHhsazJ0dVh2dmVXQnloVXF1T05HTjN3VGM5L09Vc1AwQWYvMVJV?=
	=?utf-8?B?VGJlZzduSXNBM1RjQWxieFpxenRzeWV5emwyeDUwOEF4dnh6SktvZjlOYkdp?=
	=?utf-8?B?TGFnYjFtc2ZNUDRJM1ZJVWpvczkrQWNVWEhUb0t3aEgyQlpFSUE3M2dIUWhm?=
	=?utf-8?B?VWdGc1pzTTJmSk1hamt1Mnl5MlJUODd2VGNPazBOZ3JQbUkxY21Kb1dmaVlY?=
	=?utf-8?B?anlsR09CaE1wMmtwK2dGZWRkK2VHd2EvcWMzYkpFMUdVejJNUTd4emF5RnVj?=
	=?utf-8?B?cGc2UVJiZlhrZ3JFS01CNXJaL1FlRkM5UENYNlJ5OHNFTG5DTUJqdkJ5ejNT?=
	=?utf-8?B?czdMa3VuYzRhNXdVK0xCcGlGWEQvL1RBZElXMnMwQVdtcGRabUVCUlpobTJx?=
	=?utf-8?B?VndYOHhCSUxSL2pBLzI4ejNMcEpyRDhudEpDQ3VLLzFoU0IwY2t6Zk8wVytm?=
	=?utf-8?B?R2RabFJselRabHFnSVNCWjcyM3k2enhCYTRvem82YWl1Lzh1Y2IzL01GVi9S?=
	=?utf-8?B?M0xwcUNQcFp2Y1NWcGN0a205TThpR2Q0U2NTcTF0YTVTVHd6ckRYMUY5ek9J?=
	=?utf-8?B?VThHNkxPSGhEdWYyeER0YU14Y29tbkJDaGhqaUNMemtPZy9QUFJjbi9jb1Y1?=
	=?utf-8?B?RHBGakJ0N0V5dUhOaG45TmJaNVMzdGJQYXpaclViMW54N2c1NzBBZGhZUGVy?=
	=?utf-8?Q?ugg4xTaBli5xQt94o++POWeGEAI568lJrbOfU=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b91d192-d506-4b15-490c-08d8c8778c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 19:11:45.3621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzyfT6kI4bFCEB0eChqohxJusbi15LDwEtjzO2gCZjhd+rwJix6QIdP8R4G9r4konfCQkDzRpZbJBjdzi2JhbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3958
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.14, xch-rcd-004.cisco.com
X-Outbound-Node: alln-core-11.cisco.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 113JBw61002608
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 03 Feb 2021 15:09:25 -0500
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <8694CD7F018F7343B4FFE663E3525482@namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On top of what Daniel just said:

As there are many components being tested in regression runs, it's
expensive to look back and reproduce the AVCs. And there's no prior
knowledge of what processes may generate AVCs. The alternative would be
to audit all fork/exec, but this could easily blow up the audit log.

But we'd like to hear alternatives.

On Wed, 2021-02-03 at 18:57 +0000, Daniel Walker (danielwa) wrote:
> On Tue, Feb 02, 2021 at 04:44:47PM -0500, Paul Moore wrote:
> > On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <
> > danielwa@cisco.com
> > > wrote:
> > > From: Phil Zhang <
> > > xuanyzha@cisco.com
> > > >
> > > 
> > > To ease the root cause analysis of SELinux AVCs, this new feature
> > > traverses task structs to iteratively find all parent processes
> > > starting with the denied process and ending at the kernel.
> > > Meanwhile,
> > > it prints out the command lines and subject contexts of those
> > > parents.
> > > 
> > > This provides developers a clear view of how processes were
> > > spawned
> > > and where transitions happened, without the need to reproduce the
> > > issue and manually audit interesting events.
> > > 
> > > Example on bash over ssh:
> > >     $ runcon -u system_u -r system_r -t polaris_hm_t ls
> > >     ...
> > >     type=PARENT msg=audit(1610548241.033:255):
> > > subj=root:unconfined_r:unconfined_t:s0-s0:c0.c1023  cmdline="-
> > > bash"
> > >     type=PARENT msg=audit(1610548241.033:255):
> > > subj=system_u:system_r:sshd_t:s0-
> > > s0:c0.c1023        cmdline="sshd: root@pts/0"
> > >     type=PARENT msg=audit(1610548241.033:255):
> > > subj=system_u:system_r:sshd_t:s0-
> > > s0:c0.c1023        cmdline="/tmp/sw/rp/0/0/rp_security/mount/usr/
> > > sbin/sshd
> > >     type=PARENT msg=audit(1610548241.033:255):
> > > subj=system_u:system_r:init_t:s0                    cmdline="/ini
> > > t"
> > >     type=PARENT msg=audit(1610548241.033:255):
> > > subj=system_u:system_r:kernel_t:s0
> > >     ...
> > > 
> > > Cc: 
> > > xe-linux-external@cisco.com
> > > 
> > > Signed-off-by: Phil Zhang <
> > > xuanyzha@cisco.com
> > > >
> > > Signed-off-by: Daniel Walker <
> > > danielwa@cisco.com
> > > >
> > > ---
> > >  include/uapi/linux/audit.h |  5 ++-
> > >  init/Kconfig               |  7 +++++
> > >  kernel/audit.c             |  3 +-
> > >  kernel/auditsc.c           | 64
> > > ++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 77 insertions(+), 2 deletions(-)
> > 
> > This is just for development/testing of SELinux policy, right?  It
> > seems like this is better done in userspace to me through a
> > combination of policy analysis and just understanding of how your
> > system is put together.
> 
>  
> That's why the patch was create to better understand the system.
> 
> > If you really need this information in the audit log for some
> > production use, it seems like you could audit the various
> > fork()/exec() syscalls to get an understanding of the various
> > process
> > (sub)trees on the system.  It would require a bit of work to sift
> > through the audit log and reconstruct the events that led to a
> > process
> > being started, and generating the AVC you are interested in
> > debugging,
> > but folks who live The Audit Life supposedly do this sort of thing
> > a
> > lot (this sort of thing being tracing a process/session).
> 
> We have a very complex and constantly changing system, and we use
> shell scripts
> some of the time. If a shell script triggers an AVC it will typically
> show the
> tool called instead of the shell script which triggered calling the
> tool.
> 
> We do have audit enabled in production systems, and I think we
> collect these
> logs in case of issues on the production system. Phil is better to
> address this.
> 
> We're willing to try alternatives like what you suggested above.
> 
> Daniel
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

