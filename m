Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263D65D505
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rouTTpBBM7V3+IzC+guq8GCRh+Xx9UgThtcJcaIdM+c=;
	b=LI4xKR/XFxUDHYQy1r08/Rv5YhcF/a/D3V9hpT2ZBSFOkDV2LEAShjgSarPnESrv/fkN4X
	Fj3Eih4Yx/FxC3xklSm0HHRcnjDwh1/359RZSsNZFdeHEzMrEcL8HG5QxXu2r9kZgbsgx3
	faxACaoBjt2aRhRXJWqCOJcnhBVzjRU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-C-eEom2TPXOA2q_XiATbwQ-1; Wed, 04 Jan 2023 09:07:33 -0500
X-MC-Unique: C-eEom2TPXOA2q_XiATbwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B0C63814959;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9E314171B7;
	Wed,  4 Jan 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0FF981947053;
	Wed,  4 Jan 2023 14:07:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 001A61946587 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 00:36:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D1C602026D68; Tue,  3 Jan 2023 00:36:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C216A2026D4B
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 00:36:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920A5811E6E
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 00:36:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-V_7A3JACN3ym3Vut81cMiQ-1; Mon, 02 Jan 2023 19:36:39 -0500
X-MC-Unique: V_7A3JACN3ym3Vut81cMiQ-1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348776409"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
 d="xz'?scan'208";a="348776409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 16:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="685206145"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
 d="xz'?scan'208";a="685206145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 02 Jan 2023 16:35:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 2 Jan 2023 16:35:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 2 Jan 2023 16:35:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 2 Jan 2023 16:35:29 -0800
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 00:35:26 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%9]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 00:35:26 +0000
Date: Tue, 3 Jan 2023 08:33:22 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
Message-ID: <202301022358.7f742b86-yujie.liu@intel.com>
In-Reply-To: <20221223185531.222689-1-paul@paul-moore.com>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 583a5df3-da82-47a2-87e7-08daed2267a3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: LR+Me4RVWaLVUt8Aa/vXcnlLVtdircSXLbbPyHlnC+h+MKthwP2VhAlUdBtVyDSLu2/PbNtnB3MumQUr/v9Tw6/cULD1aAO4oBuNoopCtG+V260CSw75Ac2BzqYHFtmzyPAiGn3T9Abut5VGnWJzMflsbBUNdevKWZPNA/GgCPywJm8WIIJgMZ3BAgaT+Fej13p8FonxVJDXw15298kkrHKpz8WLjFrmsbjtYOTvIHYJjrqf9n/3K63RFm5cxjRWfNJ0yA+qD0di5iq+efYbhgk4fU3iHb3J+XDreYj4TDDfQE9UuMpxqOBZvgKd8+b4ny8DzZYEfLpuUxLwRF/gW/XUh8kmjQMgQcHSuzB0zKZRxB+OaPfngXtrE4KFB2uxFQ4TPMAB0JYSm+ySe1G/jS/LC0RIaoSmXLTpb3uGfhOiuUoh5CrJ956T4sNN5BfPjGFwQ2iWvpoetIcAAXUsVMiabhtPB1pT195HZsDG0zogF5i6lgCBwszOec4iHV6z9ZETRerf7aWklhx1RYfhNah+Jctc4lGc+wLWauMJRY01shccQR6O53Va8i6pIgD0h/4p/llZt848hxvbIeQCb8nN2fbUEja2/8eYBGrrfpTfH/TWvMhLAv6jgW8ihwKizRjVRlTmG3+H0p66+UxziZqR6BKYbJsxdK7Ke5d0USqEbBOvUdug/Y+4mLVABusZnUxOkDlsXHmek8H+k21Jimvqnq1BhR0n2Z+Hu7J7NEhwaCOkWuSJsDJ0VBnoqe1nZmWr52wwc9wz4QUrleSKtHmuQ229yo1SkzE5HO8347s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199015)(8676002)(4326008)(66946007)(2616005)(66476007)(36756003)(1076003)(41300700001)(66556008)(316002)(54906003)(6916009)(45080400002)(2906002)(86362001)(5660300002)(82960400001)(38100700002)(235185007)(7416002)(83380400001)(8936002)(44144004)(6506007)(478600001)(26005)(186003)(6512007)(6486002)(6666004)(966005)(22166006)(2700100001);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJBvVoytkxWhif70IOhYoRif4gMckfUhJhnGqKisd/i6cJ/Qr9HX4K5W7tjk?=
 =?us-ascii?Q?TqHqQ1SdFN94KyObYglT1mrwZwq9n1hJwXtLvfQr/gUdAzhlVMuvF9hdYrTd?=
 =?us-ascii?Q?0LZEval+y5IFJPAlYmxBLbd+4VrxGIE0NTwiLxtOeHIM+s/w0RoMTSXcugdb?=
 =?us-ascii?Q?O1yOELj6a+r5TLFPSOBMwEJD/wvjLv/HDi07f56haZvZJp73EkZXTQtBT3a4?=
 =?us-ascii?Q?gVLsYSCSQnFC5yuWuZn1RfyCjiaHNkTwqLdSKAQonNbS0W8SPqdqgh7nSYnT?=
 =?us-ascii?Q?pT5Z0GVaZ0+CqcDOWncyZqFmKzxnebv1lrxU4QMd/nn2I0aBONlG3zsdTtq/?=
 =?us-ascii?Q?Cp5FreuEmbtQBbhhNFK7BYQQrvBOj5G36O4cTqRnPMEHlrdB6oXo0TzwtlIc?=
 =?us-ascii?Q?fa7IFpvZR8J952x8Ua8UDZlGXrv5vBg8wwAZkEI1T+hVbK9maAI+vo3/lcPd?=
 =?us-ascii?Q?cSFyWfxmJ8zsJ6oHTjHS5iBBhAGvhbDFDbK05X7X3uzf8konvIvFkeJDMbCl?=
 =?us-ascii?Q?daXZ8oteeaAqSdxOFp44CcaWPUeeirkmzJFPNZmIOTEs/5YldbC2JkCEzAln?=
 =?us-ascii?Q?aEKdls6AGV1h4A4y5Uy1JDgACRm3jn5I4WP0u/cTt5k/yD8j8eZdRaJqE2zk?=
 =?us-ascii?Q?MVatMPP9yNxVgVaA6VQhJHgltT/FXbcRF9cdwp1fohSqFRBXSk0kzcNpiX5V?=
 =?us-ascii?Q?QUwzhrNQ2LlqPWSgFBjk0p+mHqaZMAVM7eTmU+fTw3ukUspP5q26HdJFUn+I?=
 =?us-ascii?Q?P3q19S5msWmI4moQZr+nYvrYcstRToxAsPbQRvGbscPwDGBZuBSmFji7YQqL?=
 =?us-ascii?Q?P0f76MTEfkJIT9xU3VqFIBah4DkDFxRKNVLb2Erd4mWCWkvf+TnYVJ7org/O?=
 =?us-ascii?Q?1OXgbXMlcFFig6iwKYbub1yOVs9SXPyFrf59G88j3Bp9qssWBrOBGtVsek0P?=
 =?us-ascii?Q?k9ZiSKvc7q0Q9GSUxg2FTK9NGDRIr4mkQ5VvBdRXoMGUD6ZVVRAytFxQAkbX?=
 =?us-ascii?Q?u/GdnCg/9Ir/gqpUtrE8z2a5VOUJLtBnjWtr0GnGAtPAZHHBT5M2ZhMjccYS?=
 =?us-ascii?Q?Xxb+Suqdfo9xyuuHayt/dzCqsvL0//dQp2WJUplVXfvAKRMH/wjGi4V4Na9a?=
 =?us-ascii?Q?8ncq+I+CGG4H1TVUA4i/XE768ULjFXUnV+PWtPaVVVjCqZTQa5zfgo9DXn9t?=
 =?us-ascii?Q?Nz+7IUA1WAMtmy3ynINFcD4LgKZjsGKB7encH36vJOSlESEZi8nP/OcL4ZAb?=
 =?us-ascii?Q?z5WTsw7nSjf/embQsXPzAHh7smqw710aL5OtGwhEWtVhiV4WYeAQAAS83c85?=
 =?us-ascii?Q?JOzj+rAjffcDx07b1U0e7OkJ1yXogIEy+WIoce15JmsRDINctSULFKkYxOXC?=
 =?us-ascii?Q?drQ2UKb2ZFxyOC0nXrbHXcGovrWwCUo64Nbm1SsWCB6zi3n+7fJuu6Y1G0q4?=
 =?us-ascii?Q?W6d246AdeffbCI2+RTPyQ0Mhu/QLwPjekjnnzMMJTAD3qKh21y3QrPBem5Q8?=
 =?us-ascii?Q?zweaI/zvquotLhtEy06mzrrK4zTESpPbYja23I18DQJDl+KEpHdTe6CLSV9y?=
 =?us-ascii?Q?cR8muYkro7Cu4g1RivS057SkEpKvNXqQbBQariTA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 583a5df3-da82-47a2-87e7-08daed2267a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 00:35:25.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sycagiXGCsAUDas95I542Se8HZzhdD5U/i6mmiTKv73OrEmksa6jLVv076ljQOvkb+7mJanBj40mROtCpbztCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
Cc: Burn Alting <burn.alting@iinet.net.au>, lkp@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-audit@redhat.com, Stanislav
 Fomichev <sdf@google.com>, oe-lkp@lists.linux.dev, bpf@vger.kernel.org,
 Jiri Olsa <olsajiri@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="kgB0XpGQETVIN8/s"
Content-Disposition: inline

--kgB0XpGQETVIN8/s
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Paul,

We noticed that there has been a lot of discussion on this patch, and a
new version will be posted soon. Not sure if the problem in this report
has been spotted or not, so we are sending this report FYI. Thanks.

Greetings,

We noticed BUG:unable_to_handle_page_fault_for_address due to commit (built with gcc-11):

commit: 30e779c8882f2f84869405eef26e37785a1849ac ("[PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD")
url: https://github.com/intel-lab-lkp/linux/commits/Paul-Moore/bpf-restore-the-ebpf-program-ID-for-BPF_AUDIT_UNLOAD-and-PERF_BPF_EVENT_PROG_UNLOAD/20221224-025703
base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master
patch link: https://lore.kernel.org/all/20221223185531.222689-1-paul@paul-moore.com/
patch subject: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


[   83.246474][    T1] BUG: unable to handle page fault for address: ffffc90000026003
[   83.249440][    T1] #PF: supervisor write access in kernel mode
[   83.251774][    T1] #PF: error_code(0x0003) - permissions violation
[   83.254275][    T1] PGD 100000067 P4D 100000067 PUD 100122067 PMD 100123067 PTE 800000014a9c4161
[   83.257884][    T1] Oops: 0003 [#1] KASAN
[   83.259578][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                T  6.1.0-09655-g30e779c8882f #28 fbb398f715584ab16b1be88180e395d344d64436
[   83.264371][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[ 83.268137][ T1] RIP: 0010:bpf_prog_load (syscall.c:?) 
[ 83.270295][ T1] Code: ff 37 00 45 89 65 20 48 89 fa 48 c1 e0 2a 48 c1 ea 03 8a 14 02 48 89 f8 83 e0 07 ff c0 38 d0 7c 09 84 d2 74 05 e8 78 8c 19 00 <80> 4b 03 40 48 c7 c7 a0 01 36 85 e8 9e 77 28 02 e8 04 7a ff ff 45
All code
========
   0:	ff 37                	pushq  (%rdi)
   2:	00 45 89             	add    %al,-0x77(%rbp)
   5:	65 20 48 89          	and    %cl,%gs:-0x77(%rax)
   9:	fa                   	cli    
   a:	48 c1 e0 2a          	shl    $0x2a,%rax
   e:	48 c1 ea 03          	shr    $0x3,%rdx
  12:	8a 14 02             	mov    (%rdx,%rax,1),%dl
  15:	48 89 f8             	mov    %rdi,%rax
  18:	83 e0 07             	and    $0x7,%eax
  1b:	ff c0                	inc    %eax
  1d:	38 d0                	cmp    %dl,%al
  1f:	7c 09                	jl     0x2a
  21:	84 d2                	test   %dl,%dl
  23:	74 05                	je     0x2a
  25:	e8 78 8c 19 00       	callq  0x198ca2
  2a:*	80 4b 03 40          	orb    $0x40,0x3(%rbx)		<-- trapping instruction
  2e:	48 c7 c7 a0 01 36 85 	mov    $0xffffffff853601a0,%rdi
  35:	e8 9e 77 28 02       	callq  0x22877d8
  3a:	e8 04 7a ff ff       	callq  0xffffffffffff7a43
  3f:	45                   	rex.RB

Code starting with the faulting instruction
===========================================
   0:	80 4b 03 40          	orb    $0x40,0x3(%rbx)
   4:	48 c7 c7 a0 01 36 85 	mov    $0xffffffff853601a0,%rdi
   b:	e8 9e 77 28 02       	callq  0x22877ae
  10:	e8 04 7a ff ff       	callq  0xffffffffffff7a19
  15:	45                   	rex.RB
[   83.277723][    T1] RSP: 0000:ffffc9000001f900 EFLAGS: 00010246
[   83.280272][    T1] RAX: 0000000000000003 RBX: ffffc90000026000 RCX: 000000007ffffffe
[   83.283494][    T1] RDX: 1ffff92000004c00 RSI: 0000000000000008 RDI: ffffc90000026002
[   83.286512][    T1] RBP: ffffc9000001fa88 R08: 0000000000000008 R09: 0000000000000001
[   83.289897][    T1] R10: ffffed1028b397b6 R11: ffff8881459cbdaf R12: 0000000000000001
[   83.293058][    T1] R13: ffff88814aad2000 R14: ffffffff83ea1f60 R15: ffff88814aad2000
[   83.296246][    T1] FS:  0000000000000000(0000) GS:ffffffff84ed4000(0000) knlGS:0000000000000000
[   83.299784][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   83.302378][    T1] CR2: ffffc90000026003 CR3: 0000000004e3a000 CR4: 00000000000406b0
[   83.305526][    T1] Call Trace:
[   83.307004][    T1]  <TASK>
[ 83.308267][ T1] ? bpf_prog_get (syscall.c:?) 
[ 83.310014][ T1] ? __sys_bpf (syscall.c:?) 
[ 83.311820][ T1] ? bpf_link_by_id (syscall.c:?) 
[ 83.313794][ T1] ? copy_from_kernel_nofault (??:?) 
[ 83.315860][ T1] ? copy_from_bpfptr (syscall.c:?) 
[ 83.317717][ T1] ? bpf_obj_memcpy (arraymap.c:?) 
[ 83.323880][ T1] __sys_bpf (syscall.c:?) 
[ 83.325623][ T1] ? bpf_link_by_id (syscall.c:?) 
[ 83.327526][ T1] ? kern_sys_bpf (??:?) 
[ 83.329365][ T1] ? find_held_lock (lockdep.c:?) 
[ 83.331305][ T1] kern_sys_bpf (??:?) 
[ 83.333077][ T1] bpf_load_and_run+0x284/0x3c8 
[ 83.335332][ T1] ? iterators_bpf__destroy+0x14d/0x14d 
[ 83.337424][ T1] ? kasan_unpoison (??:?) 
[ 83.339268][ T1] ? __kasan_slab_alloc (??:?) 
[ 83.341334][ T1] ? trace_kmalloc (slab_common.c:?) 
[ 83.343249][ T1] ? __kmalloc_node (??:?) 
[ 83.345040][ T1] load_skel (bpf_preload_kern.c:?) 
[ 83.346671][ T1] ? free_links_and_skel (bpf_preload_kern.c:?) 
[ 83.348756][ T1] ? rcu_read_lock_sched_held (??:?) 
[ 83.350996][ T1] ? bpf_iter_cgroup (bpf_preload_kern.c:?) 
[ 83.352705][ T1] load (bpf_preload_kern.c:?) 
[ 83.354259][ T1] do_one_initcall (??:?) 
[ 83.356051][ T1] ? rcu_lock_acquire (??:?) 
[ 83.358022][ T1] ? rcu_read_lock_sched_held (??:?) 
[ 83.360100][ T1] ? rcu_read_lock_bh_held (??:?) 
[ 83.362036][ T1] do_initcalls (main.c:?) 
[ 83.363846][ T1] kernel_init_freeable (main.c:?) 
[ 83.365850][ T1] ? rest_init (main.c:?) 
[ 83.367612][ T1] kernel_init (main.c:?) 
[ 83.369180][ T1] ret_from_fork (??:?) 
[   83.370863][    T1]  </TASK>
[   83.372036][    T1] Modules linked in:
[   83.373544][    T1] CR2: ffffc90000026003
[   83.375076][    T1] ---[ end trace 0000000000000000 ]---
[ 83.377006][ T1] RIP: 0010:bpf_prog_load (syscall.c:?) 
[ 83.378816][ T1] Code: ff 37 00 45 89 65 20 48 89 fa 48 c1 e0 2a 48 c1 ea 03 8a 14 02 48 89 f8 83 e0 07 ff c0 38 d0 7c 09 84 d2 74 05 e8 78 8c 19 00 <80> 4b 03 40 48 c7 c7 a0 01 36 85 e8 9e 77 28 02 e8 04 7a ff ff 45


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202301022358.7f742b86-yujie.liu@intel.com


To reproduce:

        # build kernel
	cd linux
	cp config-6.1.0-09655-g30e779c8882f .config
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--kgB0XpGQETVIN8/s
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="config-6.1.0-09655-g30e779c8882f"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_UAPI_HEADER_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
CONFIG_KERNEL_LZMA=y
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=y
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
# CONFIG_TASK_IO_ACCOUNTING is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_TIME_NS is not set
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
# CONFIG_XEN_PV is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_GUEST=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
CONFIG_ACRN_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
CONFIG_UP_LATE_INIT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
# CONFIG_X86_5LEVEL is not set
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
CONFIG_X86_INTEL_TSX_MODE_ON=y
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KEXEC_SIG=y
# CONFIG_KEXEC_SIG_FORCE is not set
CONFIG_CRASH_DUMP=y
# CONFIG_KEXEC_JUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_NFIT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# CONFIG_X86_X32_ABI is not set
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lz4hc"
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="z3fold"
CONFIG_ZBUD=y
CONFIG_Z3FOLD=y
# CONFIG_ZSMALLOC is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=y
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
CONFIG_TLS=y
# CONFIG_TLS_DEVICE is not set
CONFIG_TLS_TOE=y
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
CONFIG_XFRM_INTERFACE=y
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_XFRM_ESPINTCP=y
CONFIG_SMC=y
CONFIG_SMC_DIAG=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
# CONFIG_IP_ROUTE_MULTIPATH is not set
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
# CONFIG_NET_IPGRE_BROADCAST is not set
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=y
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
# CONFIG_IPV6_ROUTE_INFO is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
CONFIG_INET6_AH=y
CONFIG_INET6_ESP=y
CONFIG_INET6_ESP_OFFLOAD=y
CONFIG_INET6_ESPINTCP=y
# CONFIG_INET6_IPCOMP is not set
CONFIG_IPV6_MIP6=y
CONFIG_INET6_TUNNEL=y
CONFIG_IPV6_VTI=y
CONFIG_IPV6_SIT=y
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=y
# CONFIG_IPV6_GRE is not set
CONFIG_IPV6_FOU=y
CONFIG_IPV6_FOU_TUNNEL=y
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=y
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=y
CONFIG_ATM_CLIP=y
CONFIG_ATM_CLIP_NO_ICMP=y
# CONFIG_ATM_LANE is not set
# CONFIG_ATM_BR2684 is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
CONFIG_LLC=y
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
CONFIG_X25=y
# CONFIG_LAPB is not set
CONFIG_PHONET=y
CONFIG_6LOWPAN=y
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=y
# CONFIG_IEEE802154_6LOWPAN is not set
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
# CONFIG_BATMAN_ADV_BATMAN_V is not set
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
# CONFIG_BATMAN_ADV_NC is not set
# CONFIG_BATMAN_ADV_MCAST is not set
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_TRACING is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
# CONFIG_VSOCKETS_DIAG is not set
CONFIG_VSOCKETS_LOOPBACK=y
# CONFIG_VIRTIO_VSOCKETS is not set
CONFIG_VIRTIO_VSOCKETS_COMMON=y
CONFIG_NETLINK_DIAG=y
CONFIG_MPLS=y
# CONFIG_NET_MPLS_GSO is not set
CONFIG_MPLS_ROUTING=y
# CONFIG_MPLS_IPTUNNEL is not set
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
CONFIG_CAN_BCM=y
CONFIG_CAN_GW=y
CONFIG_CAN_J1939=y
CONFIG_CAN_ISOTP=y
CONFIG_BT=y
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_AOSPEXT is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
CONFIG_BT_MTK=y
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIBCM4377 is not set
CONFIG_BT_HCIVHCI=y
CONFIG_BT_MRVL=y
CONFIG_BT_MTKUART=y
CONFIG_BT_VIRTIO=y
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_IPV6 is not set
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
CONFIG_RXKAD=y
CONFIG_RXPERF=y
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=y
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=y
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=y
CONFIG_NFC_NCI=y
CONFIG_NFC_NCI_SPI=y
CONFIG_NFC_NCI_UART=y
CONFIG_NFC_HCI=y
CONFIG_NFC_SHDLC=y

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_TRF7970A=y
# CONFIG_NFC_SIM is not set
CONFIG_NFC_VIRTUAL_NCI=y
CONFIG_NFC_FDP=y
# CONFIG_NFC_FDP_I2C is not set
CONFIG_NFC_PN544=y
CONFIG_NFC_PN544_I2C=y
CONFIG_NFC_PN533=y
# CONFIG_NFC_PN533_I2C is not set
CONFIG_NFC_PN532_UART=y
CONFIG_NFC_MICROREAD=y
CONFIG_NFC_MICROREAD_I2C=y
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_UART=y
# CONFIG_NFC_MRVL_I2C is not set
# CONFIG_NFC_MRVL_SPI is not set
# CONFIG_NFC_ST21NFCA_I2C is not set
# CONFIG_NFC_ST_NCI_I2C is not set
# CONFIG_NFC_ST_NCI_SPI is not set
# CONFIG_NFC_NXP_NCI is not set
CONFIG_NFC_S3FWRN5=y
CONFIG_NFC_S3FWRN5_I2C=y
CONFIG_NFC_S3FWRN82_UART=y
CONFIG_NFC_ST95HF=y
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
# CONFIG_EISA_VLB_PRIMING is not set
CONFIG_EISA_PCI_EISA=y
# CONFIG_EISA_VIRTUAL_ROOT is not set
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MOXTET=y
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=y
CONFIG_FW_CFG_SYSFS_CMDLINE=y
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_MTK_SERIAL=y
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
# CONFIG_MTD is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_XEN_BLKDEV_FRONTEND=y
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TCP=y
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
# CONFIG_NVME_TARGET_FC is not set
# CONFIG_NVME_TARGET_TCP is not set
CONFIG_NVME_TARGET_AUTH=y
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HI6421V600_IRQ=y
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
CONFIG_LATTICE_ECP3_CONFIG=y
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_VCPU_STALL_DETECTOR=y
CONFIG_C2PORT=y
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=y
CONFIG_SCSI_ENCLOSURE=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_FC_ATTRS=y
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
# CONFIG_SCSI_DH_HP_SW is not set
CONFIG_SCSI_DH_EMC=y
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=y
CONFIG_AHCI_DWC=y
CONFIG_AHCI_CEVA=y
CONFIG_AHCI_QORIQ=y
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_GEMINI_ETHERNET is not set
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCA7000_SPI is not set
# CONFIG_QCA7000_UART is not set
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=y
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_FLEXCAN is not set
# CONFIG_CAN_GRCAN is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
# CONFIG_CAN_SLCAN is not set
# CONFIG_CAN_C_CAN is not set
# CONFIG_CAN_CC770 is not set
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_CTUCANFD_PLATFORM is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=y
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_STMPE is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=y
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# CONFIG_SERIAL_LITEUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_N_GSM=y
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_HVC_XEN is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
# CONFIG_IPMI_IPMB is not set
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_SSIF_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_APPLICOM is not set
CONFIG_MWAVE=y
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=y
# CONFIG_TCG_INFINEON is not set
CONFIG_TCG_XEN=y
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=y
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
# CONFIG_I2C_SMBUS is not set

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_KEMPLD is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_RK3X=y
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_FSI is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
# CONFIG_SPI_ALTERA_DFL is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
CONFIG_SPI_CADENCE=y
# CONFIG_SPI_CADENCE_QUADSPI is not set
# CONFIG_SPI_CADENCE_XSPI is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_FSI is not set
CONFIG_SPI_NXP_FLEXSPI=y
# CONFIG_SPI_GPIO is not set
CONFIG_SPI_INTEL=y
# CONFIG_SPI_INTEL_PCI is not set
CONFIG_SPI_INTEL_PLATFORM=y
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
CONFIG_SPI_MICROCHIP_CORE=y
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
CONFIG_SPI_LANTIQ_SSC=y
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=y
CONFIG_SPI_SC18IS602=y
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SN_F_OSPI=y
CONFIG_SPI_MXIC=y
CONFIG_SPI_XCOMM=y
# CONFIG_SPI_XILINX is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
# CONFIG_SPMI_HISI3670 is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_KVM is not set
CONFIG_PTP_1588_CLOCK_IDT82P33=y
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AS3722=y
CONFIG_PINCTRL_AXP209=y
CONFIG_PINCTRL_CY8C95X0=y
# CONFIG_PINCTRL_DA9062 is not set
CONFIG_PINCTRL_EQUILIBRIUM=y
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_RK805 is not set
CONFIG_PINCTRL_SINGLE=y
# CONFIG_PINCTRL_STMFX is not set
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_CADENCE=y
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_LOGICVC is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_WCD934X=y
CONFIG_GPIO_XILINX=y
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=y
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD9571MWV=y
# CONFIG_GPIO_DA9052 is not set
# CONFIG_GPIO_DA9055 is not set
# CONFIG_GPIO_KEMPLD is not set
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP87565=y
CONFIG_GPIO_MADERA=y
# CONFIG_GPIO_STMPE is not set
CONFIG_GPIO_TPS65086=y
CONFIG_GPIO_TPS65218=y
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TPS65910=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_TWL4030=y
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# CONFIG_GPIO_SODAVILLE is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_74X164 is not set
# CONFIG_GPIO_MAX3191X is not set
CONFIG_GPIO_MAX7301=y
CONFIG_GPIO_MC33880=y
# CONFIG_GPIO_PISOSR is not set
CONFIG_GPIO_XRA1403=y
# CONFIG_GPIO_MOXTET is not set
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=y
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_PDA_POWER=y
CONFIG_IP5XXX_POWER=y
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_DA9030=y
# CONFIG_BATTERY_DA9052 is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
CONFIG_CHARGER_MAX77693=y
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MT6360 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_RK817=y
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_CHARGER_TPS65217 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_UCS1002=y
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=y
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_CORSAIR_CPRO=y
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DRIVETEMP=y
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_DA9055=y
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IBMAEM=y
CONFIG_SENSORS_IBMPEX=y
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=y
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX1111=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31722=y
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=y
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MENF21BMC_HWMON=y
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM70=y
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT6775_I2C=y
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=y
CONFIG_SENSORS_PECI_CPUTEMP=y
CONFIG_SENSORS_PECI_DIMMTEMP=y
CONFIG_SENSORS_PECI=y
# CONFIG_PMBUS is not set
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_SBTSI=y
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC2305=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_ADS7871=y
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_TMP464=y
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y
CONFIG_THERMAL_MMIO=y
CONFIG_DA9062_THERMAL=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
CONFIG_MFD_MADERA_SPI=y
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_MFD_HI6421_SPMI=y
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
CONFIG_MFD_CPCAP=y
CONFIG_MFD_NTXEC=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=y
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
CONFIG_STMPE_I2C=y
CONFIG_STMPE_SPI=y
# end of STMicroelectronics STMPE Interface Drivers

CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TI_LP87565=y
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=y
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_ARIZONA_SPI is not set
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM831X_SPI=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_MFD_ROHM_BD718XX=y
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STPMIC1 is not set
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_QCOM_PM8008=y
CONFIG_RAVE_SP_CORE=y
# CONFIG_MFD_INTEL_M10_BMC is not set
CONFIG_MFD_RSMU_I2C=y
CONFIG_MFD_RSMU_SPI=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_AAT2870 is not set
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_AS3722=y
CONFIG_REGULATOR_ATC260X=y
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_BD718XX is not set
CONFIG_REGULATOR_BD9571MWV=y
# CONFIG_REGULATOR_CPCAP is not set
# CONFIG_REGULATOR_DA903X is not set
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9121=y
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421V600=y
# CONFIG_REGULATOR_ISL9305 is not set
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP87565=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8998 is not set
CONFIG_REGULATOR_MAX20086=y
# CONFIG_REGULATOR_MAX77686 is not set
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=y
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6323 is not set
CONFIG_REGULATOR_MT6331=y
CONFIG_REGULATOR_MT6332=y
# CONFIG_REGULATOR_MT6357 is not set
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_MT6370=y
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PCA9450=y
# CONFIG_REGULATOR_PCAP is not set
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_PWM is not set
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RK808=y
CONFIG_REGULATOR_RN5T618=y
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT4831=y
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_RT5120=y
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6190=y
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS6286X=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
# CONFIG_REGULATOR_TPS65218 is not set
CONFIG_REGULATOR_TPS6524X=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_VCTRL=y
# CONFIG_REGULATOR_WM831X is not set
# CONFIG_REGULATOR_WM8400 is not set
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_GPIO_CIR is not set
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_NUVOTON is not set
CONFIG_IR_SERIAL=y
# CONFIG_IR_SERIAL_TRANSMITTER is not set
# CONFIG_IR_WINBOND_CIR is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_MMAP=y
# CONFIG_DVB_NET is not set
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_RADIO_ADAPTERS is not set
# CONFIG_MEDIA_PLATFORM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=y

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=y
CONFIG_VIDEO_HI846=y
CONFIG_VIDEO_HI847=y
# CONFIG_VIDEO_IMX208 is not set
# CONFIG_VIDEO_IMX214 is not set
CONFIG_VIDEO_IMX219=y
CONFIG_VIDEO_IMX258=y
CONFIG_VIDEO_IMX274=y
# CONFIG_VIDEO_IMX290 is not set
CONFIG_VIDEO_IMX319=y
CONFIG_VIDEO_IMX334=y
CONFIG_VIDEO_IMX335=y
CONFIG_VIDEO_IMX355=y
# CONFIG_VIDEO_IMX412 is not set
CONFIG_VIDEO_MT9M001=y
CONFIG_VIDEO_MT9M032=y
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=y
CONFIG_VIDEO_MT9T001=y
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
CONFIG_VIDEO_MT9V111=y
# CONFIG_VIDEO_NOON010PC30 is not set
CONFIG_VIDEO_OG01A1B=y
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
CONFIG_VIDEO_OV08X40=y
CONFIG_VIDEO_OV13858=y
CONFIG_VIDEO_OV13B10=y
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=y
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV2740 is not set
CONFIG_VIDEO_OV4689=y
# CONFIG_VIDEO_OV5640 is not set
# CONFIG_VIDEO_OV5645 is not set
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV5648=y
CONFIG_VIDEO_OV5670=y
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5693 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV7251=y
CONFIG_VIDEO_OV7640=y
# CONFIG_VIDEO_OV7670 is not set
CONFIG_VIDEO_OV772X=y
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV8856=y
CONFIG_VIDEO_OV8865=y
CONFIG_VIDEO_OV9282=y
CONFIG_VIDEO_OV9640=y
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV9734 is not set
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RDACM21 is not set
# CONFIG_VIDEO_RJ54N1 is not set
CONFIG_VIDEO_S5C73M3=y
CONFIG_VIDEO_S5K5BAF=y
CONFIG_VIDEO_S5K6A3=y
CONFIG_VIDEO_S5K6AA=y
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_ST_VGXY61 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_CCS is not set
CONFIG_VIDEO_ET8EK8=y
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=y
CONFIG_VIDEO_AK7375=y
CONFIG_VIDEO_DW9714=y
CONFIG_VIDEO_DW9768=y
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=y
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Video and audio decoders
#

#
# SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=y
CONFIG_VIDEO_GS1662=y
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=y

#
# Tuner drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y

#
# DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Multistandard (satellite) frontends
#

#
# Multistandard (cable + terrestrial) frontends
#

#
# DVB-S (satellite) frontends
#

#
# DVB-T (terrestrial) frontends
#

#
# DVB-C (cable) frontends
#

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#

#
# ISDB-T (terrestrial) frontends
#

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#

#
# Digital terrestrial only tuners/PLL
#

#
# SEC control devices for DVB-S
#

#
# Common Interface (EN50221) controller drivers
#

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=y
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
CONFIG_DRM_KOMEDA=y
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=y
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
CONFIG_DRM_RCAR_USE_LVDS=y
# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_ABT_Y030XX067A is not set
CONFIG_DRM_PANEL_ARM_VERSATILE=y
# CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
# CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_DSI_CM=y
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
CONFIG_DRM_PANEL_EDP=y
CONFIG_DRM_PANEL_EBBG_FT8719=y
CONFIG_DRM_PANEL_ELIDA_KD35T133=y
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
# CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
CONFIG_DRM_PANEL_ILITEK_IL9322=y
CONFIG_DRM_PANEL_ILITEK_ILI9341=y
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
# CONFIG_DRM_PANEL_INNOLUX_EJ030NA is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_JDI_R63452=y
CONFIG_DRM_PANEL_KHADAS_TS050=y
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=y
CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=y
CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
CONFIG_DRM_PANEL_LG_LB035Q02=y
# CONFIG_DRM_PANEL_LG_LG4573 is not set
# CONFIG_DRM_PANEL_NEC_NL8048HL11 is not set
# CONFIG_DRM_PANEL_NEWVISION_NV3051D is not set
CONFIG_DRM_PANEL_NEWVISION_NV3052C=y
CONFIG_DRM_PANEL_NOVATEK_NT35510=y
# CONFIG_DRM_PANEL_NOVATEK_NT35560 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36672A=y
# CONFIG_DRM_PANEL_NOVATEK_NT39016 is not set
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=y
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
CONFIG_DRM_PANEL_RONBO_RB070D30=y
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y
CONFIG_DRM_PANEL_SAMSUNG_DB7430=y
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=y
CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=y
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=y
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
# CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=y
# CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7789V=y
CONFIG_DRM_PANEL_SONY_ACX565AKM=y
CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=y
CONFIG_DRM_PANEL_TDO_TL070WSH30=y
CONFIG_DRM_PANEL_TPO_TD028TTEC1=y
# CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
CONFIG_DRM_PANEL_TPO_TPG110=y
# CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
CONFIG_DRM_PANEL_WIDECHIPS_WS2401=y
# CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CHIPONE_ICN6211=y
CONFIG_DRM_CHRONTEL_CH7033=y
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_ITE_IT6505=y
CONFIG_DRM_LONTIUM_LT8912B=y
CONFIG_DRM_LONTIUM_LT9211=y
CONFIG_DRM_LONTIUM_LT9611=y
# CONFIG_DRM_LONTIUM_LT9611UXC is not set
CONFIG_DRM_ITE_IT66121=y
# CONFIG_DRM_LVDS_CODEC is not set
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NWL_MIPI_DSI=y
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_PARADE_PS8640 is not set
CONFIG_DRM_SIL_SII8620=y
CONFIG_DRM_SII902X=y
CONFIG_DRM_SII9234=y
# CONFIG_DRM_SIMPLE_BRIDGE is not set
CONFIG_DRM_THINE_THC63LVD1024=y
# CONFIG_DRM_TOSHIBA_TC358762 is not set
# CONFIG_DRM_TOSHIBA_TC358764 is not set
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TOSHIBA_TC358768=y
# CONFIG_DRM_TOSHIBA_TC358775 is not set
CONFIG_DRM_TI_DLPC3433=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
CONFIG_DRM_TI_SN65DSI86=y
CONFIG_DRM_TI_TPD12S015=y
CONFIG_DRM_ANALOGIX_ANX6345=y
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_ANALOGIX_DP=y
# CONFIG_DRM_ANALOGIX_ANX7625 is not set
CONFIG_DRM_I2C_ADV7511=y
# CONFIG_DRM_I2C_ADV7511_CEC is not set
CONFIG_DRM_CDNS_MHDP8546=y
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_LOGICVC=y
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
CONFIG_DRM_IMX_LCDIF=y
# CONFIG_DRM_ARCPGU is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_PANEL_MIPI_DBI=y
CONFIG_DRM_SIMPLEDRM=y
CONFIG_TINYDRM_HX8357D=y
CONFIG_TINYDRM_ILI9163=y
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
CONFIG_TINYDRM_ILI9486=y
# CONFIG_TINYDRM_MI0283QT is not set
CONFIG_TINYDRM_REPAPER=y
# CONFIG_TINYDRM_ST7586 is not set
CONFIG_TINYDRM_ST7735R=y
CONFIG_DRM_XEN=y
CONFIG_DRM_XEN_FRONTEND=y
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_LEGACY=y
# CONFIG_DRM_TDFX is not set
# CONFIG_DRM_R128 is not set
# CONFIG_DRM_MGA is not set
# CONFIG_DRM_VIA is not set
# CONFIG_DRM_SAVAGE is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_UVESA=y
CONFIG_FB_VESA=y
CONFIG_FB_N411=y
CONFIG_FB_HGA=y
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_DA903X is not set
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_MT6370=y
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_QCOM_WLED=y
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_SAHARA=y
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_PCF50633=y
CONFIG_BACKLIGHT_AAT2870=y
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=y
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=y
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=y
# CONFIG_HID_BELKIN is not set
CONFIG_HID_CHERRY=y
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELECOM=y
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=y
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=y
# CONFIG_PLAYSTATION_FF is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=y
CONFIG_HID_THINGM=y
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
CONFIG_I2C_HID_OF_GOODIX=y
# end of I2C HID support

CONFIG_I2C_HID_CORE=y

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
CONFIG_SCSI_UFS_HPB=y
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
CONFIG_SCSI_UFS_CDNS_PLATFORM=y
# CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
CONFIG_LEDS_APU=y
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
# CONFIG_LEDS_BCM6358 is not set
# CONFIG_LEDS_CPCAP is not set
# CONFIG_LEDS_CR0014114 is not set
# CONFIG_LEDS_EL15203000 is not set
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_SPI_BYTE=y
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_LM3697 is not set
CONFIG_LEDS_LM36274=y
CONFIG_LEDS_TPS6105X=y
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set
# CONFIG_LEDS_QCOM_LPG is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=y
# CONFIG_INFINIBAND_USER_MAD is not set
CONFIG_INFINIBAND_USER_ACCESS=y
CONFIG_INFINIBAND_USER_MEM=y
# CONFIG_INFINIBAND_ON_DEMAND_PAGING is not set
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_RDMAVT is not set
# CONFIG_RDMA_RXE is not set
CONFIG_RDMA_SIW=y
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_OPA_VNIC=y
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
# CONFIG_RTC_SYSTOHC is not set
CONFIG_RTC_DEBUG=y
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_88PM80X is not set
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=y
# CONFIG_RTC_DRV_AS3722 is not set
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
# CONFIG_RTC_DRV_DS1374 is not set
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_HYM8563=y
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8998 is not set
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_NCT3018Y=y
CONFIG_RTC_DRV_RK808=y
CONFIG_RTC_DRV_RS5C372=y
# CONFIG_RTC_DRV_ISL1208 is not set
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=y
# CONFIG_RTC_DRV_PCF8523 is not set
# CONFIG_RTC_DRV_PCF85063 is not set
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_TWL4030 is not set
# CONFIG_RTC_DRV_TPS6586X is not set
# CONFIG_RTC_DRV_TPS65910 is not set
CONFIG_RTC_DRV_RC5T619=y
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=y
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
CONFIG_RTC_DRV_RV3028=y
# CONFIG_RTC_DRV_RV3032 is not set
CONFIG_RTC_DRV_RV8803=y
# CONFIG_RTC_DRV_S5M is not set
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=y
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=y
CONFIG_RTC_DRV_DS1343=y
# CONFIG_RTC_DRV_DS1347 is not set
CONFIG_RTC_DRV_DS1390=y
CONFIG_RTC_DRV_MAX6916=y
CONFIG_RTC_DRV_R9701=y
# CONFIG_RTC_DRV_RX4581 is not set
CONFIG_RTC_DRV_RS5C348=y
CONFIG_RTC_DRV_MAX6902=y
CONFIG_RTC_DRV_PCF2123=y
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
CONFIG_RTC_DRV_DS1286=y
# CONFIG_RTC_DRV_DS1511 is not set
CONFIG_RTC_DRV_DS1553=y
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
CONFIG_RTC_DRV_DS1689=y
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_DA9052 is not set
CONFIG_RTC_DRV_DA9055=y
CONFIG_RTC_DRV_DA9063=y
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_V3020=y
# CONFIG_RTC_DRV_WM831X is not set
CONFIG_RTC_DRV_PCF50633=y
CONFIG_RTC_DRV_ZYNQMP=y
CONFIG_RTC_DRV_NTXEC=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_CADENCE=y
CONFIG_RTC_DRV_FTRTC010=y
# CONFIG_RTC_DRV_PCAP is not set
CONFIG_RTC_DRV_MC13XXX=y
CONFIG_RTC_DRV_MT6397=y
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_CPCAP=y

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=y
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=y
CONFIG_DW_AXI_DMAC=y
CONFIG_FSL_EDMA=y
CONFIG_INTEL_IDMA64=y
# CONFIG_INTEL_IDXD_COMPAT is not set
# CONFIG_INTEL_IOATDMA is not set
# CONFIG_PLX_DMA is not set
CONFIG_XILINX_ZYNQMP_DPDMA=y
# CONFIG_AMD_PTDMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
# CONFIG_DW_DMAC is not set
# CONFIG_DW_DMAC_PCI is not set
CONFIG_HSU_DMA=y
CONFIG_SF_PDMA=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
CONFIG_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
CONFIG_VFIO_MDEV=y
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_VDPA=y
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VDPA=y
CONFIG_VDPA_SIM=y
# CONFIG_VDPA_SIM_NET is not set
CONFIG_VDPA_SIM_BLOCK=y
CONFIG_VDPA_USER=y
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y
CONFIG_VHOST=y
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=y
CONFIG_VHOST_VSOCK=y
CONFIG_VHOST_VDPA=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=y
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=y
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
CONFIG_XEN_GNTDEV=y
# CONFIG_XEN_GNTDEV_DMABUF is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
CONFIG_XEN_GRANT_DMA_ALLOC=y
CONFIG_XEN_PVCALLS_FRONTEND=y
CONFIG_XEN_PRIVCMD=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
CONFIG_XEN_FRONT_PGDIR_SHBUF=y
# CONFIG_XEN_VIRTIO is not set
# end of Xen driver support

CONFIG_GREYBUS=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
# CONFIG_COMEDI_TEST is not set
# CONFIG_COMEDI_PARPORT is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set
# CONFIG_RTS5208 is not set
# CONFIG_FB_SM750 is not set
CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_IPU3_IMGU is not set
CONFIG_VIDEO_MAX96712=y
# CONFIG_STAGING_MEDIA_DEPRECATED is not set
# CONFIG_STAGING_BOARD is not set
CONFIG_FB_TFT=y
# CONFIG_FB_TFT_AGM1264K_FL is not set
CONFIG_FB_TFT_BD663474=y
# CONFIG_FB_TFT_HX8340BN is not set
CONFIG_FB_TFT_HX8347D=y
# CONFIG_FB_TFT_HX8353D is not set
CONFIG_FB_TFT_HX8357D=y
# CONFIG_FB_TFT_ILI9163 is not set
CONFIG_FB_TFT_ILI9320=y
CONFIG_FB_TFT_ILI9325=y
CONFIG_FB_TFT_ILI9340=y
# CONFIG_FB_TFT_ILI9341 is not set
CONFIG_FB_TFT_ILI9481=y
# CONFIG_FB_TFT_ILI9486 is not set
CONFIG_FB_TFT_PCD8544=y
CONFIG_FB_TFT_RA8875=y
CONFIG_FB_TFT_S6D02A1=y
CONFIG_FB_TFT_S6D1121=y
CONFIG_FB_TFT_SEPS525=y
CONFIG_FB_TFT_SH1106=y
CONFIG_FB_TFT_SSD1289=y
# CONFIG_FB_TFT_SSD1305 is not set
CONFIG_FB_TFT_SSD1306=y
# CONFIG_FB_TFT_SSD1331 is not set
CONFIG_FB_TFT_SSD1351=y
CONFIG_FB_TFT_ST7735R=y
CONFIG_FB_TFT_ST7789V=y
# CONFIG_FB_TFT_TINYLCD is not set
# CONFIG_FB_TFT_TLS8204 is not set
CONFIG_FB_TFT_UC1611=y
CONFIG_FB_TFT_UC1701=y
# CONFIG_FB_TFT_UPD161704 is not set
CONFIG_MOST_COMPONENTS=y
CONFIG_MOST_NET=y
CONFIG_MOST_VIDEO=y
CONFIG_MOST_DIM2=y
CONFIG_MOST_I2C=y
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_FIRMWARE=y
CONFIG_GREYBUS_HID=y
# CONFIG_GREYBUS_LIGHT is not set
# CONFIG_GREYBUS_LOG is not set
# CONFIG_GREYBUS_LOOPBACK is not set
# CONFIG_GREYBUS_POWER is not set
# CONFIG_GREYBUS_RAW is not set
# CONFIG_GREYBUS_VIBRATOR is not set
CONFIG_GREYBUS_BRIDGED_PHY=y
CONFIG_GREYBUS_GPIO=y
CONFIG_GREYBUS_I2C=y
CONFIG_GREYBUS_PWM=y
CONFIG_GREYBUS_SPI=y
CONFIG_GREYBUS_UART=y
CONFIG_PI433=y
CONFIG_XIL_AXIS_FIFO=y
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_MAX77686=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_RK808=y
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_CDCE925=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_RS9_PCIE=y
CONFIG_COMMON_CLK_VC5=y
CONFIG_COMMON_CLK_VC7=y
# CONFIG_COMMON_CLK_BD718XX is not set
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_MAX77843 is not set
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_FPGA_DFL_EMIF=y
# CONFIG_IIO is not set
# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_ATMEL_HLCDC_PWM=y
CONFIG_PWM_ATMEL_TCB=y
CONFIG_PWM_CLK=y
# CONFIG_PWM_DWC is not set
CONFIG_PWM_FSL_FTM=y
CONFIG_PWM_INTEL_LGM=y
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_LP3943 is not set
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_NTXEC is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_STMPE is not set
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=y
# CONFIG_PWM_XILINX is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
CONFIG_MADERA_IRQ=y
CONFIG_XILINX_INTC=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_TORRENT is not set
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
# CONFIG_PHY_CADENCE_SIERRA is not set
# CONFIG_PHY_CADENCE_SALVO is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_LAN966X_SERDES is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# CONFIG_PHY_OCELOT_SERDES is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RAVE_SP_EEPROM=y
# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
# CONFIG_STM_SOURCE_FTRACE is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_STH=y
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_XILINX_SPI=y
CONFIG_FPGA_MGR_ICE40_SPI=y
CONFIG_FPGA_MGR_MACHXO2_SPI=y
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
# CONFIG_OF_FPGA_REGION is not set
CONFIG_FPGA_DFL=y
# CONFIG_FPGA_DFL_FME is not set
CONFIG_FPGA_DFL_AFU=y
# CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
# CONFIG_FPGA_DFL_PCI is not set
# CONFIG_FPGA_MGR_MICROCHIP_SPI is not set
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
CONFIG_FSI_MASTER_GPIO=y
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
# CONFIG_FSI_SBEFIFO is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
CONFIG_PECI=y
CONFIG_PECI_CPU=y
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=y
CONFIG_OCFS2_FS_O2CB=y
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
# CONFIG_F2FS_FS is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
CONFIG_FSCACHE_DEBUG=y
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
# CONFIG_NTFS_RW is not set
CONFIG_NTFS3_FS=y
# CONFIG_NTFS3_64BIT_CLUSTER is not set
CONFIG_NTFS3_LZX_XPRESS=y
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
# CONFIG_TRUSTED_KEYS_TPM is not set
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_INFINIBAND=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf"

#
# Kernel hardening options
#
CONFIG_GCC_PLUGIN_STRUCTLEAK=y

#
# Memory initialization
#
# CONFIG_INIT_STACK_NONE is not set
CONFIG_GCC_PLUGIN_STRUCTLEAK_USER=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
CONFIG_GCC_PLUGIN_STACKLEAK=y
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
CONFIG_STACKLEAK_RUNTIME_DISABLE=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_ARIA=y
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
# CONFIG_CRYPTO_MD5 is not set
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=y
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
# CONFIG_CRYPTO_WP512 is not set
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
# CONFIG_CRYPTO_AES_NI_INTEL is not set
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
CONFIG_CRYPTO_DES3_EDE_X86_64=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
CONFIG_CRYPTO_BLAKE2S_X86=y
CONFIG_CRYPTO_POLYVAL_CLMUL_NI=y
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=y
CONFIG_CRYPTO_SM3_AVX_X86_64=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_X509_CERTIFICATE_PARSER is not set
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
CONFIG_CMA_SIZE_SEL_MAX=y
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_OBJTOOL=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_TABLE_CHECK=y
CONFIG_PAGE_TABLE_CHECK_ENFORCED=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
CONFIG_IO_DELAY_0XED=y
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
CONFIG_TEST_DYNAMIC_DEBUG=y
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--kgB0XpGQETVIN8/s
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-review/Paul-Moore/bpf-restore-the-ebpf-program-ID-for-BPF_AUDIT_UNLOAD-and-PERF_BPF_EVENT_PROG_UNLOAD/20221224-025703'
	export commit='30e779c8882f2f84869405eef26e37785a1849ac'
	export kconfig='x86_64-randconfig-a004-20221219'
	export repeat_to=6
	export nr_vm=300
	export submit_id='63aebf5f973faec7aa511832'
	export job_file='/lkp/jobs/scheduled/vm-meta-106/boot-1-debian-11.1-x86_64-20220510.cgz-30e779c8882f2f84869405eef26e37785a1849ac-20221230-51114-13kr8gl-4.yaml'
	export id='4987ab2b751b1bc3d9b73c6f16dc204b9e4f5e46'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export compiler='gcc-11'
	export enqueue_time='2022-12-30 18:37:19 +0800'
	export _id='63aebf77973faec7aa511834'
	export _rt='/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac/vmlinuz-6.1.0-09655-g30e779c8882f
branch=linux-review/Paul-Moore/bpf-restore-the-ebpf-program-ID-for-BPF_AUDIT_UNLOAD-and-PERF_BPF_EVENT_PROG_UNLOAD/20221224-025703
job=/lkp/jobs/scheduled/vm-meta-106/boot-1-debian-11.1-x86_64-20220510.cgz-30e779c8882f2f84869405eef26e37785a1849ac-20221230-51114-13kr8gl-4.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a004-20221219
commit=30e779c8882f2f84869405eef26e37785a1849ac
vmalloc=256M initramfs_async=0 page_owner=on
initcall_debug
nmi_watchdog=0
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export stop_repeat_if_found='dmesg.BUG:unable_to_handle_page_fault_for_address'
	export kbuild_queue_analysis=1
	export meta_host='vm-meta-106'
	export kernel='/pkg/linux/x86_64-randconfig-a004-20221219/gcc-11/30e779c8882f2f84869405eef26e37785a1849ac/vmlinuz-6.1.0-09655-g30e779c8882f'
	export dequeue_time='2022-12-30 18:37:58 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-106/boot-1-debian-11.1-x86_64-20220510.cgz-30e779c8882f2f84869405eef26e37785a1849ac-20221230-51114-13kr8gl-4.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--kgB0XpGQETVIN8/s
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
--kgB0XpGQETVIN8/s
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--kgB0XpGQETVIN8/s--

