Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D92E1E8A37
	for <lists+linux-audit@lfdr.de>; Fri, 29 May 2020 23:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590788577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=kgJARWGFW4pYvNkFdZ1T02NXV5IruqjDw9nzl6e3nGs=;
	b=ZN/QfFX6VixuSIAcYf9d2StMe2IWrIKD5bycZEn1ERqGy3Jc8H4961bUOqMvxS8wb/iNIL
	RQPAdAM2RwNL4/K4jyyhKrEyszvETmycUyx9OILTae/j2gclVjj2BmSl8WhLGDRwLB/A6H
	sM7WRIO8fyG48cY4ZqLcuqVaiavs/KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-RLe0wuVLNgGwWB5eSNPsgg-1; Fri, 29 May 2020 17:42:55 -0400
X-MC-Unique: RLe0wuVLNgGwWB5eSNPsgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8996C461;
	Fri, 29 May 2020 21:42:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD5610013C2;
	Fri, 29 May 2020 21:42:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C1487CCC8;
	Fri, 29 May 2020 21:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TLgER8022198 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 17:42:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5E70EE36E; Fri, 29 May 2020 21:42:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1725EE858
	for <linux-audit@redhat.com>; Fri, 29 May 2020 21:42:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3996833B4C
	for <linux-audit@redhat.com>; Fri, 29 May 2020 21:42:10 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-443-IdhEuBnYOHS9PQFEkZAaBQ-1;
	Fri, 29 May 2020 17:42:08 -0400
X-MC-Unique: IdhEuBnYOHS9PQFEkZAaBQ-1
X-YMail-OSG: IIzJQqEVM1lQFZZRnGBlouvEkiOBviz9U3ZT67J3Sc90KvGnKpWeawDVkT5jfsu
	t5VPJxbqlHfKogPR4SeUcFzGaYXP4I7fgmrpLkKtQKK8aJVMf0iSWLc9lIetc5EeXpXiumdexv2T
	SVoZmwuc2VIQf1gZWzgooJQRQrKBhY.x7pjr24NwFNF8dAzyxwhSefaBpxPoSNcHmO8W2V6QjJQ1
	exQlystr0vap_ORSXP7qkn_Valj2a.ecNHjAcOk0AawWIi3RaiKXe4EIIkZs9HUx7Vn.vv4uKP6u
	a3_kaopdGpU.Zuhnx1OH9jHkB2LnXS3FRQ8Sb7PhLynWj.a_u2gK08_SuUXkVo2vC8HzcsfvomCm
	4HYngzI0QcORU0ioOxFhzY.2gKB4W.kDhLJPovRHtX36Zj5xqnZVyoN5PJJehEdpaI8FmYMn19SC
	ALNLzlULeSYKgZ8VrzXKX7wKuyrCfTJs8GbsWo09JZt1KGE2U48T3zvHeoho9fyuHCH4KnzZHhRU
	NSLWWcnLUIsQLBUG_uOHARkNNoslSqCIxXs0GjZZahp9BEAKl3n5pIRtytRFZOJBiqDDhmFjJBbL
	e8lJO5q62qcu76JAoJmT7yuit7JYoa9ESGNTaK5VGlH67FhZ9mo1IW0PkoRdnNBTE.J6y6Bf5Bf0
	jYyoGcbU_lzTVPyJ5KmQjXyPaG_6hP9kjUzqeJrM3QGAbV4KDrO1rpaYmnNKEINeVrjEeyGurbRM
	81QN87sYP5E7rY03oB_biQ4V7SXNR53Sq7A8P77cOjPZ9XTw16I.HdZ1Pfezu.vj7CzTW5VOsgKQ
	9e0jvdHAG87_Bp3ZRLtx__xBDTVuKCrjkRJ5_qN5mkJUu5m82hPUK8k2NkkcRr7.16tgpN_1PDCH
	rRHvDlBTGLxShaokBRz7K4x8uN3bMlr5xji.39blcryNtNnib7luFE7qV2i1_Nq9iURQwv8gbZ6N
	Q2gj10WZTU7QhTCcv3jSGW0z0pIMKxQGFMyH1CtuExb.j02ZofAs_2Lx79Wj1RibVUCtpo7LYllT
	OOCQbDMXPPKfoyuXXo328_loFc6eVJWg_uLXFMYuThaZPUOBqcOTthTx3OAzwMFgRdzocwifauAB
	W1VCYxzka0kRAGUA7CAGH3nYPFhqFqLxYronQ2dvmr.Tiyqz03654KJBuh2EIOjelIRdOn9XQ2EH
	hwRHdaLB3CwBBjaJmiPniI3VB34WY_kOMtkNLhbNB9HGEc09j70626V2pzSHPDuCC5Xnin0PVAPI
	CNkAMt2LCvD0o4LLiFkTUkziDaWqYx_d3fEvOzL6u1dDIp02W5IYdIGhSSKieXioUeDovSfXq98L
	7_hwdDQZAFUXc.3W.Hv3UlMoYqrLTcj2n7.0WfKdksN3fimbtt9NuO6lgucNr7hM8_JpctrJx5E9
	WSOjNdwezDsAkGFSRVvhMk6.zbK0x0NUF
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 29 May 2020 21:42:08 +0000
Received: by smtp403.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 6d345c7747c19a606058c6738cb5033f; 
	Fri, 29 May 2020 21:42:03 +0000 (UTC)
Subject: Re: The audit "context" and when to expect it.
To: Paul Moore <paul@paul-moore.com>
References: <45ce3357-ca82-8721-22d6-dabe751ad8fa.ref@schaufler-ca.com>
	<45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
	<CAHC9VhQL9Q=b75o3Y6o4VvQb97tgkhqbJ4z3zQUBm6wsWvUF9A@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <29258822-14bb-5ef9-eec9-e5d09f22d70f@schaufler-ca.com>
Date: Fri, 29 May 2020 14:42:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQL9Q=b75o3Y6o4VvQb97tgkhqbJ4z3zQUBm6wsWvUF9A@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04TLgER8022198
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
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

On 5/29/2020 12:01 PM, Paul Moore wrote:
> On Fri, May 29, 2020 at 1:59 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> What does a NULL audit context (e.g. ab->cxt == NULL) tell
>> me about the status of the audit buffer? It seems like it should
>> be telling me that the audit buffer is being created for some
>> purpose unrelated to the current task. And yet there are places
>> where information is pulled from the current task even when
>> the cxt is NULL.
> The simple answer is that a NULL audit_context indicates a standalone
> record, meaning a record with a unique timestamp so that it is not
> associated with any other records into an event.  If the audit_context
> it not NULL then the information in the context is used to group, or
> associate, all of the records sharing that context into a single
> event.

OK, so if I want a add a sub-record with the multiple secctx values
for the events that include a subject value I need to change those
events to use an audit_context. Is that going to introduce an
unacceptable memory or performance burden?

>
> This is just one example, but a non-NULL audit_context is how PATH
> records end up being associated with SYSCALL records in a single
> event.
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

