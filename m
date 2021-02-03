Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F48230E3DE
	for <lists+linux-audit@lfdr.de>; Wed,  3 Feb 2021 21:10:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-s5IvnGqePP-ysO-L7dGPHQ-1; Wed, 03 Feb 2021 15:10:05 -0500
X-MC-Unique: s5IvnGqePP-ysO-L7dGPHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05195100A8FD;
	Wed,  3 Feb 2021 20:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 508BAE160;
	Wed,  3 Feb 2021 20:09:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1954518095CB;
	Wed,  3 Feb 2021 20:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113IvU8w001296 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:57:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70DF810500DF; Wed,  3 Feb 2021 18:57:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A89C106567B
	for <linux-audit@redhat.com>; Wed,  3 Feb 2021 18:57:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AC87811E88
	for <linux-audit@redhat.com>; Wed,  3 Feb 2021 18:57:27 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com
	[173.37.142.88]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-524-TGDIMtAyM5qcKoKPR9FVXw-1; Wed, 03 Feb 2021 13:57:25 -0500
X-MC-Unique: TGDIMtAyM5qcKoKPR9FVXw-1
X-IPAS-Result: =?us-ascii?q?A0AQAgDV8RpgmI0NJK1iHAEBAQEBAQcBARIBAQQEAQFAg?=
	=?us-ascii?q?U+BU1GBVzIxCgGHfQOODAOPchaJEYJTA1QLAQEBDQEBLQIEAQGESgKBfAIlO?=
	=?us-ascii?q?BMCAwEBAQMCAwEBAQEFAQEBAgEGBBQBAQEBAQEBAYY2DYVzAQEBAwE6BgEBN?=
	=?us-ascii?q?wEECwIBCBUDHhAUHicEDgUZgw2CVgMOIAGmHgKKJXSBNIMFAQEGhSEYghIJF?=
	=?us-ascii?q?IEkgneKbhuBQT+CJYIFPoQ+hXmBWWsHgQ9LAoEqNjcsD49AgwOLOJpPCoJ6m?=
	=?us-ascii?q?3MxD6MRtiUCAgICBAUCDgEBBoFtIYFZcBWDJFAXAg2OIRqDV4pZdDcCBgoBA?=
	=?us-ascii?q?QMJfIoIAYEQAQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3AyIitsxPqiYkiP7VErY4l6mtXPHoupqn0MwgJ65?=
	=?us-ascii?q?Eul7NJdOG58o//OFDEvK8x3kfAQIGe7vVDkeeQuKflCiQM4peE5XYFdpEEFx?=
	=?us-ascii?q?oIkt4fkAFoBsmZQVb6I/jnY21ffoxCWVZp8mv9PR1TH8DzNEXbv3n36DkVAB?=
	=?us-ascii?q?i5Pg1wdaz5H4fIhJGx0Oa/s5TYfwRPgm+7ZrV/ZBW7pAncrI8Ym4xnf60w0R?=
	=?us-ascii?q?DO5HBPfrdb?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,399,1602547200"; d="scan'208";a="640289544"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	03 Feb 2021 18:57:08 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 113Iv8SQ031310
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Feb 2021 18:57:08 GMT
Received: from xfe-rcd-005.cisco.com (173.37.227.253) by XCH-ALN-005.cisco.com
	(173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 3 Feb 2021 12:57:08 -0600
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xfe-rcd-005.cisco.com
	(173.37.227.253) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
	Wed, 3 Feb 2021 12:57:08 -0600
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (173.37.151.57)
	by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server
	(TLS) id
	15.0.1497.2 via Frontend Transport; Wed, 3 Feb 2021 12:57:07 -0600
Received: from SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
	by BYAPR11MB2950.namprd11.prod.outlook.com (2603:10b6:a03:8f::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24;
	Wed, 3 Feb 2021 18:57:05 +0000
Received: from SJ0PR11MB5037.namprd11.prod.outlook.com
	([fe80::f5b5:4b05:475a:f82c]) by
	SJ0PR11MB5037.namprd11.prod.outlook.com
	([fe80::f5b5:4b05:475a:f82c%7]) with mapi id 15.20.3784.016;
	Wed, 3 Feb 2021 18:57:04 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Topic: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Index: AQHW+l5c7p0UJchtWEm2GCMjkqfQVw==
Date: Wed, 3 Feb 2021 18:57:04 +0000
Message-ID: <20210203185700.GK3710@zorba>
References: <20210202212930.18845-2-danielwa@cisco.com>
	<CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [128.107.241.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3389ea2e-7202-447a-0b38-08d8c8757f91
x-ms-traffictypediagnostic: BYAPR11MB2950:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB29502FFB13416691487307C5DDB49@BYAPR11MB2950.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: DLGzezFKBr/murDubv1QiXf6H9C4RQrzW/g0D00DYX1MiJQPa4mgFIgs93TfNB9UWhwBIQsQX5jGCL7zOg98fsnH9ZK7jiWmFs2QhTLzjKkkBJgOLgeWx7LTe1LsSH9p8qNC1qG+uGnZdtiERiZKIWYyIRk/doTLHvlu9kygE9zFqE62auUTgSP9rxaH6+fKIz52ngVgz2KLVHO00PuS35CA5nGibKjGwu0YtzZ83X3KS2L33Kqqd3uNGNyOvoyGUTmSMe+zMcqciQWZd6YuJGUwQKOgqCX/G7l0TBp8ijNQQIALDF6FQ85wyKYSItSthKd1hcPLj37FXSNWiQX8AojIwF0ImxTthwmrdUtD4S1XYRYendIlDrq13UT0Obt+bdauFnkc004CmeTaTNAFSBTP6e8SmjoaDzmheF9Z8kX/3s3SHWfvfaKhRSu0E0oUDf+YxHsT5Mqc5W6qvuDu71OJxt+ereJ6/IjstYYUfKdXkVTpB40gBi0krDCh+ioEPewAejjDfAZjnPHWquy+Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR11MB5037.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(4326008)(8936002)(5660300002)(76116006)(66946007)(33656002)(86362001)(26005)(1076003)(83380400001)(9686003)(66476007)(66556008)(316002)(71200400001)(186003)(6916009)(6486002)(6506007)(53546011)(478600001)(54906003)(6512007)(64756008)(33716001)(2906002)(8676002)(66446008);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FNhfT/Yen7tthn6574qLSiIjoFWljYRE2gFnhgbTqiMP7g0jIYbFCSQKuoGH?=
	=?us-ascii?Q?TkNHfMPT1ZR+MjD7uX7Uujt0EeMwcbnNcLFKSMNVOhq7caBPh/xbjcwNIh6J?=
	=?us-ascii?Q?PZZfUvEuXLpSSePCNz7dWwSe8jrY07RzIQp8Ot9nq9LAeTnRt+wXm/ixYVeD?=
	=?us-ascii?Q?d1p8DpYbhvtNXGwQI5RShy7RZ3/g8SGesxywvqX972l6UPFz0GaY3oVcoJEO?=
	=?us-ascii?Q?eJYMLFvfdbXLfEB24iJXeTrmkBkh6HlPTFoRpbXsAmKSNHL+E9hKr2Ivt3A2?=
	=?us-ascii?Q?RsAoI1g29Ra/FUQjW4etpJNyZfqbpoK1EwIfdleshIal3hDl3PBTDxPsTWB4?=
	=?us-ascii?Q?22iIV/J1Myx9bI5/d814ypv6UcWNaUtmnXVaW+i9FurvlSut1WXF/Yo0AlXR?=
	=?us-ascii?Q?YREYTRvMrNfsIlHJ20QlvXv0IZ61yTFh0+nVqkMMEH8zutKQLzpRLuwMZsrt?=
	=?us-ascii?Q?Z4lZ7xWGBrjU7j7TrmfA8lzHvFAcHiU1A6iHqaR7DYlQ/Slngzlzq+ZC/Gkt?=
	=?us-ascii?Q?H5+qZ+aO98BQUEEsXiWDdp7ofaqZf3X6QDaZgcM3i2MLa2MTZksvmvGPTlbX?=
	=?us-ascii?Q?hwdBXAV+nL/FcOvtjdKBqANMWuM7V0qsHn7cMgG2Xtymq8mIiAGMVEzSGLl0?=
	=?us-ascii?Q?T9PW5msRYJzkJVtwb64QrbCMfKCMovnJGJ9ShxcQg8Qo4m6DO6KfLhIrmyvq?=
	=?us-ascii?Q?ZgYSjIb+fY/cu6j73KnYChmJ5hl3O0/GA4LHKLG21ezTcHiOXzY0XG1NjMiL?=
	=?us-ascii?Q?AaQyS7+FcFRl9FU8cUhM+jVIkY3YG1iQTxfsjbeus/oEIZHz+n60XwwnFyWS?=
	=?us-ascii?Q?12j6qsCQFqYSGMVpN5BbG8VCvs3iHypD42x7KrADWVyQw2GxoibolA+Yy1W2?=
	=?us-ascii?Q?nj6MDauCV8YRwT6K1uLSxaBamlGWTgIpLVLMom7Arw54UV7fu3zBLkmliaQz?=
	=?us-ascii?Q?+pSanS7s0VUfDBnITKLbAdDXukaLrYaR6Gof/7mXQ8bjAwmg4mASUGhop79B?=
	=?us-ascii?Q?vILcmZAeDR1k8XTLjInwHpFra1QXrzgmVEJgjeVtmyPqq7osiRpT06y6fKHL?=
	=?us-ascii?Q?rDL/D0Z0A9WNOAKJhRRe5+MrW6w7i9C59ntFQu4KdGQ8U+eJm2NwuEB/WLlC?=
	=?us-ascii?Q?s+xWSObgjEgTPZ3DSiWCAt6t7QBs5IJhagrU2vOe8nqL/VKBl5Y2m0Hs8Ei/?=
	=?us-ascii?Q?4Ge1/yC+dyYkvbbwNrBH+DvVBMsTzZilAnggjbN4ez+GbZg2R832SypYT1yh?=
	=?us-ascii?Q?rRZz2wct2JEwn6oyEdWLgXFYyFuVnYYIlT4DMGzjZkT8XN1L7BlPdWP1J2Jq?=
	=?us-ascii?Q?vdG++XATuU3KMImo2JyvYbok/J8a9t7Zlx/2xA0EC5Gf3Q=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3389ea2e-7202-447a-0b38-08d8c8757f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 18:57:04.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CiVcqMk9db43+HcVKndE6mz/cxGYSNCHtZRk/2ZSz76ueXNlBfUNhuLHL9qWMytFcqSCDoUwuDNe3rY809SVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2950
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 113IvU8w001296
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 03 Feb 2021 15:09:25 -0500
Cc: "Phil Zhang \(xuanyzha\)" <xuanyzha@cisco.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
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
Content-ID: <8E62BA3099DF324FB2947520907E43F9@namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 02, 2021 at 04:44:47PM -0500, Paul Moore wrote:
> On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> > From: Phil Zhang <xuanyzha@cisco.com>
> >
> > To ease the root cause analysis of SELinux AVCs, this new feature
> > traverses task structs to iteratively find all parent processes
> > starting with the denied process and ending at the kernel. Meanwhile,
> > it prints out the command lines and subject contexts of those parents.
> >
> > This provides developers a clear view of how processes were spawned
> > and where transitions happened, without the need to reproduce the
> > issue and manually audit interesting events.
> >
> > Example on bash over ssh:
> >     $ runcon -u system_u -r system_r -t polaris_hm_t ls
> >     ...
> >     type=PARENT msg=audit(1610548241.033:255): subj=root:unconfined_r:unconfined_t:s0-s0:c0.c1023  cmdline="-bash"
> >     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="sshd: root@pts/0"
> >     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="/tmp/sw/rp/0/0/rp_security/mount/usr/sbin/sshd
> >     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:init_t:s0                    cmdline="/init"
> >     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:kernel_t:s0
> >     ...
> >
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Phil Zhang <xuanyzha@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >  include/uapi/linux/audit.h |  5 ++-
> >  init/Kconfig               |  7 +++++
> >  kernel/audit.c             |  3 +-
> >  kernel/auditsc.c           | 64 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 77 insertions(+), 2 deletions(-)
> 
> This is just for development/testing of SELinux policy, right?  It
> seems like this is better done in userspace to me through a
> combination of policy analysis and just understanding of how your
> system is put together.
 
That's why the patch was create to better understand the system.

> If you really need this information in the audit log for some
> production use, it seems like you could audit the various
> fork()/exec() syscalls to get an understanding of the various process
> (sub)trees on the system.  It would require a bit of work to sift
> through the audit log and reconstruct the events that led to a process
> being started, and generating the AVC you are interested in debugging,
> but folks who live The Audit Life supposedly do this sort of thing a
> lot (this sort of thing being tracing a process/session).

We have a very complex and constantly changing system, and we use shell scripts
some of the time. If a shell script triggers an AVC it will typically show the
tool called instead of the shell script which triggered calling the tool.

We do have audit enabled in production systems, and I think we collect these
logs in case of issues on the production system. Phil is better to address this.

We're willing to try alternatives like what you suggested above.

Daniel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

