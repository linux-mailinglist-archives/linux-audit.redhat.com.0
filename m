Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 053C824E2DF
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 23:56:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-ZcG7MK-uMwC-mE9xSqtsag-1; Fri, 21 Aug 2020 17:56:31 -0400
X-MC-Unique: ZcG7MK-uMwC-mE9xSqtsag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABCF10ABDA9;
	Fri, 21 Aug 2020 21:56:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9F57C534;
	Fri, 21 Aug 2020 21:56:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1CDE59CCD;
	Fri, 21 Aug 2020 21:56:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LLuFB9029507 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 17:56:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33E921009BA0; Fri, 21 Aug 2020 21:56:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1093117DB03
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 21:56:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DD0D901842
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 21:56:10 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-d7iDPoQ4NHuW5SLzhfOWjA-1;
	Fri, 21 Aug 2020 17:56:07 -0400
X-MC-Unique: d7iDPoQ4NHuW5SLzhfOWjA-1
X-YMail-OSG: IbsUV4UVM1l91noITGEJB6E.2DA5I1kp8CqbDiVn5Y9J5D6FiULgwQhVRRTwowr
	BJ5c2kztNQC0VkCSjcDGPVfApEYNOCNwBrCjJCCZgNWtCuOEpuOU_ekTM4UiDWoRvjZJOaN3gZv7
	dBmRm0Xz4QwhS4Jr.lkl.jf6TmbMCW5WkVIHDfw0cUp3nX3oAMcpep9DHV9dODu3ndAq6PrxlM39
	PUJmJbLlDW6gUspOdUjrIAUYfJD5CAeo4D2pWxoCEbtkUAc.JNIU1Yuh2qJocZCG31M0EnMJCCVF
	HbrbKOcTM_lUJ9TiYMMxS1YLXDYQBT.xAPJO1uby4xaQV1y4IU4HxjlmNf2JZwamO1Sps_9pYbzI
	1TiIAWHTfL90Bynwnhh_4dJDPiHGW9i9ewImytpcMfcfPNVYSSFSGi0jHWvOXk2rN0MgfB.5PasI
	8Z775z.bLrHRUcLFshRJV1add_Z1oNKPC8qij1FeVFTb7AMjAC3iGWomjqG4yzfs0uLS5dv38ZSx
	lAXYPfoqOrMudNRNyOEQqH8R37nhY8iG2zwJukv5HgF3aMpdj0nsY3pHHdUVk_YtJqrPYIAVFeJc
	KbZPOhkAl4VYHnkj.tARLQE4PZk6FDxrVz8RP.UzxUaj6CFrBzxcgSzZnu2jI4LQrE0ChjdB8Bc5
	MqqDThn8Ji8C.rYLSnWUBSqBf5alv9Sbp_9Ew5q.rdCbUMmmsR9X_9UierHPRkbtCqit6yEAn6Yo
	URLQ45WirY5VMqT7jMHmm_dZCm5PI9BEe4IF9S5MGUM0hvicO8O6RSerK3Ejysqv9Hf5YuBg_J1A
	CP_zRGblr1nlcAbRDR5.BOI9xmuytDeEmcy_wILxVlAghVNDjhvYQtSBjnFCKj7pFCfXar2VM4hl
	4shfSnqqbv8wzFeScyF6V2BmXEEi2vlSWWInyr4x844UH_CstSO7kvfF0QdMPNfzXQ69jGwcwbcv
	p1eutjESbWovWs40IqTNEM8_V6TPhtHbraDT_FbFDWa34aFm0ZgqlDb06VcKNV2pWjwdIm739SNe
	0_TR68qWUKOnaMCQgChCBsyLmlsVilFED45kMka3CZJ.OCiCaKDqDOriruyiQbM8j8KwZuZiBJaw
	yS8FW5QD3hhqzlnRWj6RHco9VDYhPFO08za83mrbD_IN55Heul9RWI6_DQ25x77AijdddyJa1kYI
	_ZwBtpm7_2qbQ_4Oy8hOgEpIdPc0J2GBCc8VikrkB.fUUaDY9aAjjdnYKgmVB_pGa1.OqAj7u0dt
	T4uYPJ.2lz3ZAugByTE1Pf9hwYM4i_F9oGfiDBXKjGxDFxsnz1EpNOZI_9nrL9b8xrC8kvnqUq1d
	zoVkr0frmBk7HEwmXN5nG1CiUK8s2ylhZsURp.e6vJ32QBlWAvbkO_iUfB.xTQxoblV25WTIrtPP
	n8M3GnK2IkD9_8CHUtMe_k38jNpY8ZyEQp4OxJ..eGsya_Cav9BZpMrBvBtPbAp6ZyvpPA98uHSF
	49gTi7HPAI6dXvJSAknlHIQ.IJeY8MoHDg0UjD1Y8UvHfxX4.x8kMl6RNlbTMLOIPeoxuwpdsaVb
	BPIXi6Ss-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 21 Aug 2020 21:56:06 +0000
Received: by smtp408.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID e6892f6c7bd237c2ff4e6ddf2aeb0158; 
	Fri, 21 Aug 2020 21:56:02 +0000 (UTC)
Subject: Re: Administrivia
To: Paul Moore <paul@paul-moore.com>, linux-audit@redhat.com
References: <CAHC9VhQXYuS8_tK6NQxXw-cn_+6xJ=RMD_9u=z=DFjgSi=pF2Q@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <4fcd8835-9239-cba6-e13d-3d00a88b2290@schaufler-ca.com>
Date: Fri, 21 Aug 2020 14:56:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQXYuS8_tK6NQxXw-cn_+6xJ=RMD_9u=z=DFjgSi=pF2Q@mail.gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/21/2020 2:35 PM, Paul Moore wrote:
> A heads-up that I've replaced the "master" branch in the audit
> kernel repo with the "main" branch.  This should have little to no
> practical impact, but if you run into problems let me know.

Sounds ominous. Why the change?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

