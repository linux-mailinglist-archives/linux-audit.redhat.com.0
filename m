Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE0E225DDB8
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 17:29:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ihXE3-LTNf-_169p64t97g-1; Fri, 04 Sep 2020 11:29:53 -0400
X-MC-Unique: ihXE3-LTNf-_169p64t97g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11ABAEE8C;
	Fri,  4 Sep 2020 15:29:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF67D6FDB6;
	Fri,  4 Sep 2020 15:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A86ED7A30E;
	Fri,  4 Sep 2020 15:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084FT0NN018412 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 11:29:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF24510FACB; Fri,  4 Sep 2020 15:29:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9AD210FADC
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 15:28:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53ABF827EE0
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 15:28:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-370-QviTM1JsMJWwM12qC-INJw-1;
	Fri, 04 Sep 2020 11:28:55 -0400
X-MC-Unique: QviTM1JsMJWwM12qC-INJw-1
IronPort-SDR: k5jMaXbcdsi/puKoaRxRdk9VYJbK4ThXFL2VP3pFAIQQw701T3QeayhoYY0PcTW5oKrw3cRgMY
	vEKXrtLJBHlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="157025045"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157025045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	04 Sep 2020 08:27:51 -0700
IronPort-SDR: aSqmxwhjHl2JdrAEVEi6qxD90cOwIbryoVMwCbjEUGsf5FEHRfnF8qMw8rRVXLamPngF2C/viF
	HgPVLbF2oTvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="326708994"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
	by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2020 08:27:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
	ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Fri, 4 Sep 2020 08:27:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
	ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Fri, 4 Sep 2020 08:27:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
	orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
	via Frontend Transport; Fri, 4 Sep 2020 08:27:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
	by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1713.5; Fri, 4 Sep 2020 08:27:49 -0700
Received: from BYAPR11MB2888.namprd11.prod.outlook.com (2603:10b6:a03:8c::19)
	by BYAPR11MB2967.namprd11.prod.outlook.com (2603:10b6:a03:8a::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16;
	Fri, 4 Sep 2020 15:27:48 +0000
Received: from BYAPR11MB2888.namprd11.prod.outlook.com
	([fe80::9122:412c:358:28f0]) by BYAPR11MB2888.namprd11.prod.outlook.com
	([fe80::9122:412c:358:28f0%6]) with mapi id 15.20.3348.015;
	Fri, 4 Sep 2020 15:27:48 +0000
From: "Christian, Mark" <mark.christian@intel.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: Security Auditd Config for Enterprises
Thread-Topic: Security Auditd Config for Enterprises
Thread-Index: AQHWgswn1xApo4qb2kq3S61KQndFXalYmkqA
Date: Fri, 4 Sep 2020 15:27:48 +0000
Message-ID: <50bd1306d7e3aff619a83f83e6c7a46e614ceb29.camel@intel.com>
References: <CAHvE9BK5+oRZrUCOkJ+Ong8z-R2ZVOmi-CZfddXJboRqWOGRkA@mail.gmail.com>
In-Reply-To: <CAHvE9BK5+oRZrUCOkJ+Ong8z-R2ZVOmi-CZfddXJboRqWOGRkA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32)
x-originating-ip: [134.134.136.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8ef002d-ac5c-4748-0c50-08d850e714c8
x-ms-traffictypediagnostic: BYAPR11MB2967:
x-microsoft-antispam-prvs: <BYAPR11MB296731FA6DE4DF11641E3544852D0@BYAPR11MB2967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ITcfCNr8Jjnl8mP2hB8BdryE5T3jULbF9QfgTd28n7g3faUENF7mf9hiMUigKqkpJ/o8L8fAcQzOqdvRd9XmrMaMiwdnRoNysuvIBL8BwqqSn0vLWQlphm634Z4t3yfCTNGCQpAMRdnG3ySZnr7wjePUAs5X6UCp3a7NR/JhuWmKpGxFBG3v6MM3UHUn84bEwAEpAwJZb5dPtjL/PnocIw91v8IYiSQivLIFHOqjhU0F7n/53WQCy8TAlE+SS7XrMhsISrfuAwxssBr0cMWLTnYrrGtOOSoqvAgDe6wdAwqe1z+2Ii5aT/nWtEV7nYa75xjRofhIaekQGUmAEArKk1u/mIGwf3A+pjAdkXGH7gs0FqtMapKuXwpTnWIc3mJ3vkoiIm1TTJMgxDIW+ZkvHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR11MB2888.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(478600001)(6506007)(8936002)(8676002)(36756003)(4744005)(2616005)(76116006)(316002)(66556008)(66476007)(66946007)(86362001)(64756008)(966005)(66446008)(186003)(6512007)(5660300002)(6916009)(2906002)(6486002)(15650500001)(26005)(71200400001)(83380400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: tZmO2LD0fVTU8m0lj1xk4VHMAsRCcYl1a4PcLiSEoMnbI5L+em6uMYDhxr7NMIRK4o4WqaqpxUaa69ND7AqqGuruZ7U47iRRrhUgQ/VxSBKyPilbhcd6ND4WjrmnaH5jUVR/091MKUNcrZ1xw7sZ4UsejsK1Wq5F5BboYGR2v9xN8l5maCCIpq2p9wNL81oD5SnhYzzGBU8aA1KklSpmbCi0H0nRmop5CONxi9l786PS6+k+iESzbWUf3OhGiXoEPlsVrlIpsFDrDQoWlRyIoRQGRVNAfiz0GPt8MOQ9sJfFR8wx+Bvgd0l5KXDax2hzUDGA39O03Gl7iooHP9tYO/gO1P+lOKgNmj0FzJuvIsblH708L9pCqjjdGcu31KRBUfJPzqA47mCk2TdUzBRdNWUd0CEyyFf8QVcVreRy0mfdWj3zBZ+nVV1beHdLKUvlMRYkbPTN0irqpNuOyUplc1ljAAM79VzDw95HqdEmdhp1veG6iT8nIa/Knq000ZIfISbIYYgmskH4Asvy8sKASqeWBOk5j973PksfU5OArI02CMUdxVgi2QFqJUo4jd1oe/QHFSXKkhtnecDlniKqRDFNhLOOjcZp0xzNsJM9QgH39boAkMV/9LhLdzbgvbHmcSdQuNCieSgt3wo/2XLGNw==
x-ms-exchange-transport-forked: True
Content-ID: <C552E67D07E6B143BD89F37B26E1FB6B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2888.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ef002d-ac5c-4748-0c50-08d850e714c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 15:27:48.7668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdDAkOSAQkWkdu/mka0yH5RCTVrPigaPef42WqLAwKR+uB1u0/BbO4bBnOM334T1mRC/33nWgPaX4QbzqQpV9y1V/0u1t0pm7i4QPpXo4/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2967
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 084FT0NN018412
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Fri, 2020-09-04 at 19:08 +0530, Rohit Nambiar wrote:
> Hi all!
> 
> Apologies if this topic has already been discussed before, I couldn't
> find an easy way to sift through older archives.
> 
> Is there an auditd rule set which offers a reasonable level of
> security visibility and has been tested on enterprise production
> systems? And if such a rule set can be shared here? 
> 
> I'm looking for a base document to deploy/modify for use within my
> organization. Many thanks in advance.

consider:
https://github.com/linux-audit/audit-userspace/tree/master/rules

Depending on the age of your auditd, these examples may not work for
you, so test and verify.

Mark



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

