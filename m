Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D66B0D5F
	for <lists+linux-audit@lfdr.de>; Wed,  8 Mar 2023 16:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678290689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yAER+jucwPUfPz0HRcEezEdRrmTH2urxSZ3Xb64QyQ0=;
	b=ClJL2sjr6wyy0ATbR8K1drc2INHH67jqwC5Yho59fVe2B/kT/p3DFPaCeWywE4kBWZ7yci
	CSg0ZIbLHfNNSZBezV8xy3gIZ97GGONeAE005vZIXBmg0xZAA20fM/fCJmtydrAIqD+9ou
	wrtwr7axF/cBhLKbLn/MeiggoI4qPNo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-xDuHPVWjPhOM1fKgDpgkjA-1; Wed, 08 Mar 2023 10:51:25 -0500
X-MC-Unique: xDuHPVWjPhOM1fKgDpgkjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E48193C025D1;
	Wed,  8 Mar 2023 15:51:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81B05440E0;
	Wed,  8 Mar 2023 15:51:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B30901946A49;
	Wed,  8 Mar 2023 15:51:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2F30C19465B7 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Mar 2023 15:51:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 238192026D2A; Wed,  8 Mar 2023 15:51:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEBB72026D76;
 Wed,  8 Mar 2023 15:51:13 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>, linux-audit@redhat.com
Subject: Re: Key based rate limiter (audit_set_rate_limit)
Date: Wed, 08 Mar 2023 10:51:13 -0500
Message-ID: <2878938.e9J7NaK4W3@x2>
Organization: Red Hat
In-Reply-To: <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, March 8, 2023 6:53:39 AM EST Anurag Aggarwal wrote:
> > Limiting of audit records is actually done in the kernel, and
> > currently the rate limit applies equally[1] to all records, there is
> > no ability to enforce limits per-key.
> 
> One question Paul, will it be ok, if we contribute something similar to the
> Auditd Kernel repository?

I'm not Paul...but I think what you are proposing is a per rule service
class. Always and best effort where best effort gets discarded when the
backlog is above some heuristic. And rules not saying anything are assumed 
always for backwards compatibility. The main issue is that rules are defined
here:

https://github.com/linux-audit/audit-kernel/blob/main/include/uapi/linux/
audit.h#L510

There just really isn't room to add more thinkgs without some userspace API 
problem. (This would definitely need a feaure bitmap so user space can make 
sense of it.)

I suppose we could declare some bits in flags to carry this meaning? Anyways, 
maybe others might chime in to say if they want/need such a feature.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

