Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C96529B4
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 00:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671578215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ctOUMwQ5Ob4+5G2YQa4aJvDaQZH1OsDGCNSPM8yKNxU=;
	b=inujWiU9UCtUFK0dUQAaYwl5GrAGPP6VKCaKmWuotvNMFJJARnyR1WCdFF0Wex31rTkM6t
	VwAFXnxGQnImAqueeD3l+HcK4r15JcPFrM6xsvploXj0BVu4p3/qbKMV4V71UwwUqNPsLb
	bbA0VufOcx2RUOsfiGcsYzjIJAnawYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-P3nA1aTePSCW-mtDN8LlZA-1; Tue, 20 Dec 2022 18:16:53 -0500
X-MC-Unique: P3nA1aTePSCW-mtDN8LlZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67365802C1C;
	Tue, 20 Dec 2022 23:16:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4E422026D4B;
	Tue, 20 Dec 2022 23:16:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5A9D19465B3;
	Tue, 20 Dec 2022 23:16:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D11E19465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 20 Dec 2022 23:16:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B9594014EB9; Tue, 20 Dec 2022 23:16:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4285940ED784;
 Tue, 20 Dec 2022 23:16:46 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: Re: BPF audit logs
Date: Tue, 20 Dec 2022 18:16:45 -0500
Message-ID: <5652312.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Burn,

On Tuesday, December 20, 2022 5:36:28 PM EST Burn Alting wrote:
> I note that the unsolicited AUDIT_BPF audit event only provides a program
> id and operation (load or unload). For example, 	type=BPF
> msg=audit(21/12/22 09:03:35.765:439) : prog-id=75 op=LOAD or	type=BPF
> msg=audit(21/12/22 09:04:05.883:460) : prog-id=0 op=UNLOAD
> I also note that the bpf auxillary structure (struct bpf_prog_aux) that
> holds the program id value, also holds a name (struct bpf_prog_aux->name)
> and uid  (struct bpf_prog_aud->user_struct->uid). Perhaps adding these two
> items to the AUDIT_BPF event would provide more security context for this
> unsolicited event. Thoughts?

I agree that the resulting event leaves a lot to be desired. When the patch 
was being merged, I think it was pointed out that all we have is a number. 
The BPF folks seemed to insist that was all that was needed. They never 
explained how to use that number for anything practical like knowing what was 
loaded. If anything can be done to improve the situation, I'd like to 
encourage a patch. Systemd triggers a bunch of these events. But what it's 
doing is unknowable.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

