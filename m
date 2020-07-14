Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B069221E5BB
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 04:38:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-jBsoTwHFPpqZq_Y67hHN0w-1; Mon, 13 Jul 2020 22:37:59 -0400
X-MC-Unique: jBsoTwHFPpqZq_Y67hHN0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49CD2106B242;
	Tue, 14 Jul 2020 02:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DF81001281;
	Tue, 14 Jul 2020 02:37:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1604180954D;
	Tue, 14 Jul 2020 02:37:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E2bZ8o008185 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 22:37:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C3EF1102E0F; Tue, 14 Jul 2020 02:37:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D2A1102E0B
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 02:37:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1255818E0ACE
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 02:37:33 +0000 (UTC)
Received: from sonic313-16.consmr.mail.ne1.yahoo.com
	(sonic313-16.consmr.mail.ne1.yahoo.com [66.163.185.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-HJz52umINQKS6clHq1ftWA-1;
	Mon, 13 Jul 2020 22:37:30 -0400
X-MC-Unique: HJz52umINQKS6clHq1ftWA-1
X-YMail-OSG: XjKde2oVM1lt5JL6xa4RM_Df5tnnp3n6DTIFbP1gJLaLH3XQ7QO4wUMlfL4bgRe
	1tB2QYqMGih6kDpV9E1sIbgkHtf4rKZm1SH3ZvAQLv10DvZCaRvTTwWK0dXTyVmceUOUx0ONNTHT
	l7miDwyOZaN6v0AOhIQOOtubHnKwZT3d4vdOMO8BCmQRguTyb3a_2BVxQu69nVE4TaizjTO75Uww
	sZEyxyIDbbt_H_Mey5nKVXHBGs4KcNInfasa5do4CRNWW11KK8ab09LiLTt5nTy71_tyJjfQ0NKE
	8wFc7_OwhbChoaIzxPPVQ5nCXgFJ5szp1AiAL8ZqXslO82HcXwcWqIOFjhoCSQ3AHrEPYOw5kSD_
	aUomjwzM2YfgiygUyjXCeGLtbTrpzEyWM12RLKIIT3EuHbFu.ziXShzijkI7aDR_4hiRG.g5r2hm
	hUkQd37Q6gcXFnwDqPDpsYOwRVowi8ZimFieC1_Wij8VBYlS9K21OXw8UdHxoLbRrCB8XSHCyFQA
	XKxxhtUIL5sqPSStYSljUde903_teXLobB.5a5U01w7AHbNp7uN830l9rwuCnr3qhiR2HnnEmeV9
	DbE9ae7bUtbaFBczE.Ac1wbZ9oBXtb8P3mFI_b.BTyBxFviCYKGhgcRlIzr4G2qL9JgLwzxvKpS2
	JkgB9IEiyeNTaqiGhWqXUvYTi_bv8S88Ppkrlw1nJePYbD_oX5Ue5QHiJsFRs_T04BYkw6tpA6Zq
	M5al1ND_EXdiQxdspsDQU9KCMCU07Ba6Ksb3wHcpIVFNKJfPfZNNe5o_ubjY8f6p_FKVJDqZTi1p
	E97a7IXtdzN5vVn.1w2o5Vd_QZ8MClAzpfbr2RD_7NjtpwJiyujE8OGoVtSI5mJYfT5eFUvVB0_C
	ZKHRJbTyl5Hve0FaaF_gwEvNKUALZpZ63S5zIkb9ARBW97wS.VuNu0F1v49YFtwBBYTCmE7OQjil
	w8Dm3kuZ2_ZOdLK_TqWqm.Pei_Ke7bgaMraYVPUZMzbUazDHJvDbxqWGS2_GRFTOka0_RdfztxNm
	IWxJKE_pZAbLqE7GwVfCutS8EuGj0N4qHvawAeu_1d_9XAjpiXEffTn6BsOG5p1tDNKEXrVJF1If
	nH5ouq6DtfiTixMC.OM1DrHmp0Op.E8qUrGPrB9ejWQM0yRwc.aI2102XIGfPirNhS7phsySz.Qc
	ihL90L7TXbyfAuuroseR8jidcr30m3EGUyC.tzs.zJ73bcHCT7954GBMHWL06OClW0Lhdns_czLt
	i9FjwaMVMC6MSY2k1rDfyJSY6.8e9ry7vw7MvHIWhXVZW5iYB58v5L1MqEhP5DxcJ772uucGbGvW
	IGEcXBDb5SDg.DvagpFQ0uUvFg6A17enGi7Uy9.ztu2ctv3o.SisNUQFhiuoe7QGwgLHjNCVkO1P
	3mmMZRmuLM4qadxQ-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 14 Jul 2020 02:37:29 +0000
Received: by smtp412.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 746e89740f84756248d9661b6f450a40; 
	Tue, 14 Jul 2020 02:37:25 +0000 (UTC)
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Paul Moore <paul@paul-moore.com>, Richard Guy Briggs <rgb@redhat.com>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
	<CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
	<20200714010814.rbmpsbmyvyj5tab4@madcap2.tricolour.ca>
	<CAHC9VhQB6m_TtsQEnpanfaAd_mH3wp4jg-UByTjvdyUinw5Y9g@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <a882800f-9677-7bcb-9833-1fd8f374f6ff@schaufler-ca.com>
Date: Mon, 13 Jul 2020 19:37:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQB6m_TtsQEnpanfaAd_mH3wp4jg-UByTjvdyUinw5Y9g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06E2bZ8o008185
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/13/2020 6:19 PM, Paul Moore wrote:
> On Mon, Jul 13, 2020 at 9:08 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> On 2020-07-13 20:11, Paul Moore wrote:
>>> On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> ... but it does appear that I could switch to using your audit_alloc_local().
>>> In my opinion, linking the audit container ID and LSM stacking
>>> patchsets would seem like a very big mistake, especially since the
>>> consolidation you are describing could be done after the fact without
>>> any disruption to the kernel/userspace interface.  I would strongly
>>> encourage both patchsets to remain self-contained if at all possible
>>> so as to not jeopardize each other.
>> I see no need to link them.  The audit_alloc_local() patch could stand
>> on its own to be used by either patchset and doesn't need to be included
>> in the contid patchset.  There is no mention of contid in it.  Patches 8
>> and 11 depend on it so as long as it is already upstream that's fine.
> Let me be clear, please don't do this.  I really dislike that we need
> audit_alloc_local(), but we do because computers are awful things and
> audit is perhaps even more awful.

Computers *are* awful, and getting awfuller. Audit is awful beyond
comprehension because the people who wrote the audit section of the
Orange Book didn't talk to the people who wrote the access control section,
and neither talked with anyone who hadn't worked on MULTICS. I wrote three
UNIX audit systems, helped out on several others and derailed the POSIX
effort completely. I have tried to avoid understanding Linux audit so far,
but have finally gotten to the point where I have to know something about
it. It's far from the worst I've seen. There are aspects I find peculiar,
but I have my (rather firm and old fashioned) notions.

> Someday I'll make my peace with audit_alloc_local(), and/or it will
> become something more useful through consolidation, but now is not the
> time to push on this issue considering where the audit container ID
> patchset is at.

And now I'm coming in with a similar notion for stacking. Thanks for
your forbearance. We know there's lots on your plate, and that we're
coming at you from all directions. 



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

