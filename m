Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C8772CD4
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 19:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691429162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jN+kdOx2DERPxuAlJIfZAbzNBP+2GOgyA6XjpcSLPZA=;
	b=TY/YZ5RzvWd7YPwrMVlkwi8Nc3V2MLih0UHYUPDm7ChrCmblrB8x4Fk9TRt64Y1IBxdOi6
	nV7377HjNnwVTn9yNTzL6GkQuZQ/1oRjoOXh8F1vX4wiR9eJnOm1blabU2OXyVwoZYWe5A
	WQDy7dj8cfEuFddhtx7ao3P667BM6AE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-HPckGQcDNkqRnKC8-HcncQ-1; Mon, 07 Aug 2023 13:25:59 -0400
X-MC-Unique: HPckGQcDNkqRnKC8-HcncQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 779D329DD98C;
	Mon,  7 Aug 2023 17:25:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B47DC15BAD;
	Mon,  7 Aug 2023 17:25:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A93D194658F;
	Mon,  7 Aug 2023 17:25:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3BFA71946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 17:25:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C2BB1121315; Mon,  7 Aug 2023 17:25:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244A71121314
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 17:25:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC508DC671
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 17:25:36 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
 (sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-fTPM_FgiOn6LCFd6JzkKYQ-1; Mon,
 07 Aug 2023 13:25:34 -0400
X-MC-Unique: fTPM_FgiOn6LCFd6JzkKYQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1691429133; bh=dJ1cR7f5eD1V8rxu0WT+ljHiiXVOYYUa9Ps9UJJK+MX=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=gmnkpAy+UEKFus2ogSQoZUMYa6rbWI8+iy9AR2ojnwXrNZ61QcXwKvY5K3L2CiAtRGnhgKlmiovpNphZAnBEL9VJ7n9NbVKSDAZMeAfGBnHfc4E8F4mPOv40sR98ejjIrNaNck/2e1YPBZbRpyrfHdYoHwltEnhL954ptIZjlwoWX2ZDY4DNiNix6ccrLMRzvTyCWrpOKLVzm0l74TjLXtL2GU63EUR/Xa1tC1Bal3wr2u9mOqc8KlYg0JUvuLM//vcw8Y+3ZGyuu6XqGzf8+G9WFXWbWzA7On9ff09zXYl37/CxqDHvyP1+ovHI6cD8sMKitSOlYEE9zZ1L1l3ZCA==
X-YMail-OSG: mn.BZnQVM1mikmp_E8Ig6YkXuBNQYedape1X093SMGBpAV2TCG4SZOxslgpteq5
 4Ksvhu3xWYESjQoJGsKwxxlBBsFugcLjkhBapPucEjfMWke3URl0ei5HWXo9q0aNp0xFulTbgeBH
 YcMc6iy3806lWj_pWy_kqVVbE0nCJJkE60J9ulNhTS1IZ2j0Nuo2PYHj_fg9q_LVSMNbmfai.hV4
 Byd_wMZHkENwN4b7HkN1e6VLth94ix9DzNINauTQJEJA67D96FmlKVhS12Qcuz17g17.7Y5DTSaz
 cUcs6ai3cQRb3WozmX3Vcx03j2ofCCYd_LA3g91GnOUhkeZ2dvEVErv0jbWzCSqlYgR3mZTtPdni
 XDMX7SoXQeKf3aZNOFaMLGX7afsR_xBSBoCUxm2ksNvXT5Gn7G9Etk90HV4_FN1bYXw8..bAU8rQ
 m1GljrX3XtosB5VS8tDf9FwQYnTn..L80fa0A6XqgA_MM6sw5LGZOtXo8fb45oSEyDeRw084zs6n
 6DkS.GF.fem5fM1nLKFpj.k1buWSIn36CaOIs.VXnRCMQSET3JVlS4XPbKvfNRy.UES_ZzjcuJT9
 gjAO.sHt1hSnBribJuGCg2TBcXA5OJgg5G4PjDQpbRc6JmkFtNHcIpONHUZwjPX1ZNs5RoTc5pAP
 ygmZ_aSduCZp86ku.9DvIUvm2PZSz5KY93N5KBXYQbY6CK2J0fsNWGVV5uZCNlX3ztDxftn5sybY
 DvqiHdW6o6rlsWOp9ZkQHclUVXY6z9nsCHyXqFVZLcNus9K3qkv_7Im7I1AeoxAczBed3Du9oVsS
 kj8jH1tUDV8Vm.ZlC6rl2TBl3.IWJcwUO2PzdjAgkJR_9wrgGIolFVKrGu.9nfYMiDwHnbkqQveG
 qHbFgVV49xVQGORHqjMI8WlEacI903bYQTyONWf2f0LEmRSdCRdoYw.fCk6se.CfN95662KoSPPL
 i5z6POAI9SLkMa6wIST5byTv.9vGUUhSxilc09qaNHQAf1x7.fEf2ZVx8zcVDDMUT_24lmy.Q5Vt
 Ty6CWmWupKI2.SyJIHBxVMlmuHJby3REBhbUJsyRRPFpHozMeDAL_vVV4ZLqVa9dwPFYVvhwWN4o
 67z42PSDs77_iH0zs8hf7RNN_BY3.x5X6rBNXlNECJlpZf95jukr..zUeathkpX5_4GNjv7hbeg6
 I3b5AV3i4J9QI4ucAv6zzeTCzRjwYmmXnxC_fxwrdOv7m5Io9fEAt5F9qxuzAHPaKW5lSl4eIiC2
 WlpcpqYiJPm4759RARbSF6vzryZJE8IVDN298D2_KzLjfrfiTsVUrOtUtU5oZmllyL6lTOIpM_Ge
 Fou9E5LDePW9cd58Obzh7qTzSD4yubqUxMpJTK9oLZaKXEBFsvswnQ0IBiotQkSJG.l5zvK5Kqif
 MfOmJ4T9w2rUoT6aKxb.Yz_.FjzcP6lxiGym5KrTWPByflPvxmZSxoNir0RRUx8oJHGF8GZnea3B
 W7GSpExLOXNZAW.wAZSrfFYbZNytG2C9GmSlGfeohfzVYGjqnL7n75jp.CvkMDQxITP8Hq.Rzvsl
 uLqucx_3yPA_6ntr59Px6dYXiJRaday7IGmLt5tqeSJbxE_KUXxmlSsA2FFxcPAzSGygd6fSCGl5
 .iJMS7rvtDke.gwhU0ERb.bepi4OkC7uPIVzWeM4ZSLhWCCJe8ef02s8JWKOBCLotj_GaqP7jG6w
 tK1yMvone.hyM44S3U4Ijvo6T2MvsOWTZUvUfwUTl1pKmZ8utHPGFT7DyrbsPgT1Pouh1_oybFLH
 34OGTR_Vd.pvTK0TZLW2AdAVrZVsSdXtk8RZs65levP_TTQRW_WXa8gtYBnwVGYs50ZpEzSPRJe2
 KH_CF9bMI.WnEJzFN61WTq9FnB7KTFKTyHKCILOcc6_SySpj3GNniTj7oCtHd4p3deX4ynya3NkT
 ewt.qKVZy8y_XqWMCnRusJBgnv2DcdrggVAZr1H6KRZyGBDMx83t7AEgLLad6oVHj7pj6hCqh7HX
 R6FAXx4dd3Vs_equ6d3_9QKLo2W.ExudW8ajmvq1BIeN7HjIek8wVE8oYWth5JwtZ0GKwaJlbV_j
 TTNlEI_O269T50vNRdgXOtjnHN.SDJxnKkzETfR8ggEkwH.sXv4rEDgJJ4q6xprQEVxsVPnRrc_b
 n4QkISmdwJtNS4JokcZmfc9wQt8iZPvoa8XtmFbJyXD8trsdsqoL53A1RlWsijVO0F78nciR7_7T
 MDtwutz3_EgbvwzIbRa5mj8QicDw6cQDwXthfapXBFVT5.daA3oGSN4DYP2hGILJXHqvzwaogzdW
 heQh0
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: cfc42d55-4b9e-434e-a7b1-2d79dfb22f87
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Mon, 7 Aug 2023 17:25:33 +0000
Received: by hermes--production-gq1-6b7c87dcf5-j6k2s (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 994d43e12a7a466d9fc7c4ece85b9a78; 
 Mon, 07 Aug 2023 17:25:26 +0000 (UTC)
Message-ID: <02351542-ea4b-0987-4cc9-56ca7ecf54f7@schaufler-ca.com>
Date: Mon, 7 Aug 2023 10:25:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Steve Grubb <sgrubb@redhat.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 audit@vger.kernel.org, linux-audit@redhat.com
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <2029076.tdWV9SEqCh@x2>
 <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: schaufler-ca.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/7/2023 7:24 AM, Tetsuo Handa wrote:
> On 2023/08/07 7:01, Steve Grubb wrote:
>> This is where the problem begins. We like to have normalized audit records. 
>> Meaning that a type of event defines the fields it contains. In this case 
>> subject would be a process label. and there is already a precedent for what 
>> fields belong in a syscall record.
> What is the definition of "a process label"? SELinux / Smack / AppArmor are using
> security_secid_to_secctx() hook for providing string data for the subj= field.
> I don't think that they are restricting characters that can be included.
> Then, what is wrong with returning subset of ASCII printable characters from
> tt_secid_to_secctx() ?

I would say that a "process label" is the information about the process used
in an access control decision. I agree with Steve that putting the process
history in the subj= field is the wrong approach. I also agree that a separate
record is the way to go.

>
>
>
> static int selinux_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
> {
> 	return security_sid_to_context(secid,
> 				       secdata, seclen);
> }
>
> static int smack_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
> {
> 	struct smack_known *skp = smack_from_secid(secid);
>
> 	if (secdata)
> 		*secdata = skp->smk_known;
> 	*seclen = strlen(skp->smk_known);
> 	return 0;
> }
>
> int apparmor_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
> {
> 	/* TODO: cache secctx and ref count so we don't have to recreate */
> 	struct aa_label *label = aa_secid_to_label(secid);
> 	int flags = FLAG_VIEW_SUBNS | FLAG_HIDDEN_UNCONFINED | FLAG_ABS_ROOT;
> 	int len;
>
> 	AA_BUG(!seclen);
>
> 	if (!label)
> 		return -EINVAL;
>
> 	if (apparmor_display_secid_mode)
> 		flags |= FLAG_SHOW_MODE;
>
> 	if (secdata)
> 		len = aa_label_asxprint(secdata, root_ns, label,
> 					flags, GFP_ATOMIC);
> 	else
> 		len = aa_label_snxprint(NULL, 0, root_ns, label, flags);
>
> 	if (len < 0)
> 		return -ENOMEM;
>
> 	*seclen = len;
>
> 	return 0;
> }
>
>> What I would suggest is to make a separate record: AUDIT_PROC_TREE that 
>> describes process tree from the one killed up to the last known parent. This 
>> way you can define your own format and SYSCALL can stay as everyone expects it 
>> to look. In the EXECVE audit record, there is a precedent of using agv[0]=xx 
>> argv[1]=xx argv[2]=yy  and so on. If you want to make these generally 
>> parsable without special knowledge of the record format, I'd suggest 
>> something like it.
> Yes, https://lkml.kernel.org/r/201501202220.DJJ34834.OLJOHFMQOFtSVF@I-love.SAKURA.ne.jp
> used AUDIT_PROCHISTORY instead of LSM hooks, but that thread died there.
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

