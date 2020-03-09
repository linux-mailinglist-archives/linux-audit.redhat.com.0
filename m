Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A73617E57E
	for <lists+linux-audit@lfdr.de>; Mon,  9 Mar 2020 18:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583774156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=Udgfb2Q87A4HSM/6L+2N7RWc7L4Q79XYOCwMOgi5gGw=;
	b=TzfD9FXH4SOVpJAyK/zsyXObVdegQ6q1U0HE3ywJSyoxolxXJY21xr1t+ujaBNtNvGg0Ax
	f4OWS2O1HlDPvnX+wz6ZAXxBNwaLwG6Fbh3pftlIvb3diMYOsIgdgPIKEwEPgQRKw1XcHI
	2k1lJXyalzqQxYyMzBsZuSon8QA5LLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-VXM-8osbPRChRVQ2Y1bc5g-1; Mon, 09 Mar 2020 13:15:53 -0400
X-MC-Unique: VXM-8osbPRChRVQ2Y1bc5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E6AD19057A1;
	Mon,  9 Mar 2020 17:15:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1925C28F;
	Mon,  9 Mar 2020 17:15:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37D384499;
	Mon,  9 Mar 2020 17:15:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029HFPT0022826 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 13:15:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEE332166B35; Mon,  9 Mar 2020 17:15:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9EFB2166B32
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 17:15:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C37380030F
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 17:15:23 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-02DhwFaHMK6sC_7pnEHnfg-1;
	Mon, 09 Mar 2020 13:15:21 -0400
X-MC-Unique: 02DhwFaHMK6sC_7pnEHnfg-1
X-YMail-OSG: N1X132AVM1nWBsptGXyLmeUElVxcvapvN4vfalJWb.0EgUG9QiovgRpJ4GXse_r
	ZQHDvGh2crblbhWNV1.l77drxlZqa_bneOFXT2lAOL1ZeTGYDAvZSKs4EQInh6621TRLhg0PxyI9
	gyvphjsiOmiKZLQLOydKoCN0X3lkR3QdPshEJYdUy7CLx7xWbGYFUwra5jePOiAcjRji4nb_9.0W
	p_fO2EpCIiGYdT7S1k2oYKsDDizQvL0hTpNu4QnLewDPi8fBn_hmrZ6Ogkwi9Az3MetS0Dgzlm8B
	NId8ybIaflP_T2tl5gyIz7pGsQzNSHHOtKChT2VxFNARmPUDTnheNKrv0plLzkTu0V4YP4.Ci3Cf
	ADa62UR4nH654Qo6rQEXUK.1S0xApGGcUfdu_csTSLt0j.tryFifGKSutSuzdoImrot0fELWRYjP
	RZ9uIlkizWor4nHAdTTCM24xmDj1W8KK9ZeGoG2BM7d_KwXcnTwvlxsDld9d6V48rhuKwVIhPYzC
	1NKuzNIgTjUgyBW8MbgSH9Z.aFhlHuQbHlEsMVvDGB3_fkQhiNr.I7J3qZ850VWR6o7us4TKrROM
	8HZt4sZlhLFGoa4ZdDn.BiNJ6ez8QB63rjh529v8BvmrSWShD.ZvCWN0ATHer6vTcySbhf6ORwnu
	KElawYhfmZK5_l0HYQj5SSqwKb58PB42UKCv.vZ76tpBESYG_sw9VqWQqfHckdWSRh1wwx3V75qq
	0V24WOjaVHZ5RuCsdRekkOa.fPX1isjNdwwXaA4Oc8jCzkhgpUgWKIufIxEbcIUyjGysr1b2kUuZ
	wDkfKrCfN8Uhm0tSqoFXuBJk9_QIc4ou37P.a0Sk2rIyzhVrgeNjfy1DZsU33gk55JQs2HaIi5cN
	ESv_WHtUVlWUtOu.OaInwfpGGVtfdeJJ6aSkyrp9NSvEBNHudfXaheNE4WXTlzCcXZaOQdVmGjoU
	E_1fWHQBwGRcO7FW317el1sDnUPEg2A1U6fH3l7.K5AV7DYErcRvKopalhZb_6ptVgYgxY9ukq55
	BcyeOhP0uVhMuWvjC.eRf9m7gXglcJ5KtJ62m8sfs4Jb9ZnNuwkR6n.VMnB4lVhZygKquWnVH90m
	.yD24AjRDUFnfQjToP1.zUjNF2mZlw0Rp6GwldWO.gsqol2UyZPUD6ndAZNHsvzdsvYgMoobkm3_
	3YWZ0RoAz.EVpA8h9SGoGBvlAB3WSDyU2VoCQP4H3N_EqzR9gY2VSIub7ozD.GDBhrO.8Kvjbb3I
	kfTwzocFQsFzQzyYhnoPT2KJg0L8hjL68VLqNkIuHgXCt.HWFP6RYfr3pXBjQE3iaz8fxy0YiJG0
	wS7Ma.unlbOtSGZFUVRA.Mdk2R5uWevzqgywqWedrLBJvSrspgeSmvub5cwc5bFqDKz2K_zz8m.M
	Y1oQFrhlXcIqpYquDPLA-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 9 Mar 2020 17:15:19 +0000
Received: by smtp423.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID bcdbd41b1ca4b8d23f1ed7df729f5abb; 
	Mon, 09 Mar 2020 17:15:16 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
To: Steve Grubb <sgrubb@redhat.com>
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
	<658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
	<52786936.4IqQbOQo6H@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <2f2695b5-dad9-9207-27a4-3786dff29c04@schaufler-ca.com>
Date: Mon, 9 Mar 2020 10:15:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <52786936.4IqQbOQo6H@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029HFPT0022826
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
	linux-audit@redhat.com, casey.schaufler@intel.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/6/2020 9:14 AM, Steve Grubb wrote:
> On Tuesday, March 3, 2020 12:22:31 PM EST Casey Schaufler wrote:
>> On 2/27/2020 9:29 AM, Casey Schaufler wrote:
>>> On 2/21/2020 4:03 PM, Casey Schaufler wrote:
>>>> Resending the audit related patches to the audit list,
>>>> as there have been problems with the CC lists.
>>> There's an awful lot of interaction between the module stacking
>>> and the audit sub-system. I have not gotten much feedback about
>>> the audit changes recently, but I can't bring myself to think
>>> this means there aren't any concerns. Before I start pushing for
>>> the stacking to get pulled I would really appreciate either ACKs
>>> or meaningful comments from the audit community. I can see that
>>> there's a lot going on in the audit sub-system, and appreciate
>>> that priorities may be elsewhere.
>>>
>>> Thank you.
>> I have to start pushing on this series. If the audit community
>> hasn't any additional feedback, I'll take it that what's here is
>> acceptable and move my lobbying efforts elsewhere.
> There is a limit in user space that may cause problems.

Oh my.

> MAX_AUDIT_MESSAGE_LENGTH    8970 // PATH_MAX*2+CONTEXT_SIZE*2+11+256+1
>
> This has been in place for years. This is designed to hand the AUDIT_PATH 
> record which can have PATH_MAX * 2 for name field, then it has 11 bytes set 
> aside for other fields, then 256 bytes to handle the largest possible SELinux 
> label. So, if we are agoing to stab other LSM's into the object identifier, 
> how big is it? Do you have a max size that everyone has to fit into?

We already have a potential problem here. This implicitly limits
the size of a label for all security modules. While we don't have
a problem for any of the existing modules, it reasonable to assume
that some module some day may want more than that. We have a dearth
of documentation on what security modules can and can't do, including
limits like this.

> Changing this constant in user space is not something that you set and are 
> done. Everything will need recompiling.

Unfortunate, but hardly a surprise. I can see that having a MAX_AUDIT_MESSAGE_LENGTH
is going to require some finagling regardless of what value it has.

> And one other question, no field names are changing because of this are they?

No field names change. subj= and obj= remain as they are.
subj_selinux=, obj_smack= and the like are added.

> And if a distribution has only 1 LSM, will anyone notice a change in format?

No. Explicit steps are taken to ensure that the new fields are produced only
if there's more than one active security module.

> -Steve

Thanks for the response. I'll be making more comments based on Paul's feedback.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

