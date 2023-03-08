Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425B6B1500
	for <lists+linux-audit@lfdr.de>; Wed,  8 Mar 2023 23:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678314142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Dcplz1HNUHlufcmmyIu1CTEb5eaDBFQTTiNraXuOpM=;
	b=K2KwTqe6gIT9Kqmd6QbrJ1nyt31+/W8IE8DcbsT8D0kFLyudpphYW5DFklVAmJ3zCnPpB7
	Pso4geyhL1OcPYGTRqJsNMCrpNzGZMSCpQgzMIng0czfwpf/D61ER0rI0qR4P1a34+T5cG
	3KV6x16Ccpl9YsUCEtPR1nUAS9P+okA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-rVO50XyPNa6CTshi9XyqMA-1; Wed, 08 Mar 2023 17:22:20 -0500
X-MC-Unique: rVO50XyPNa6CTshi9XyqMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74D6618E0924;
	Wed,  8 Mar 2023 22:22:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3584C14171B6;
	Wed,  8 Mar 2023 22:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 35A8D1946A49;
	Wed,  8 Mar 2023 22:22:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D661819465B5 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Mar 2023 22:22:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CBFE440DF; Wed,  8 Mar 2023 22:22:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B99440DE;
 Wed,  8 Mar 2023 22:22:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: How to define audit rule for one bit *not* set for a syscall
 argument?
Date: Wed, 08 Mar 2023 17:22:03 -0500
Message-ID: <12326100.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAH2vwOt3yCNhcLc+7QWvRAvSoNmtCJDpC4m41_sno7u_Rmf88A@mail.gmail.com>
References: <CAH2vwOt3yCNhcLc+7QWvRAvSoNmtCJDpC4m41_sno7u_Rmf88A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Richard Du <duxiong@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wednesday, March 8, 2023 8:46:57 AM EST Richard Du wrote:
> I'm trying to define an audit rule with auditctl for clone() syscall, and I
> would expect that the a0 of clone() syscall (i.e. the clone_flags
> argument) without the CLONE_THREAD flag bit being set.
> 
> int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...
>                  /* pid_t *parent_tid, void *tls, pid_t *child_tid */ );
> 
> From man page of auditctl, -F option build a rule file: name, operation,
> value.
> -F [n=v | n!=v | n<v | n>v | n<=v | n>=v | n&v | n&=v]
> 
> I can understand that, the n&v (Audit_bitmask) means any bit of a bitmast
> is set, and the n&=v (Audit_bittest) means all bits of a bitmask are set.
> 
> While my question is, how to build a rule which means "none of bit of a
> bitmask is set", i.e. ( ! n&=v ). If the current audit comparator dosen't
> support this, can we add the support in furture?

The comparator does not support this. This is a corner case in which this is 
the first time someone ever needed it.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

