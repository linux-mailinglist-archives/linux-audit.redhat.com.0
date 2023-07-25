Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B82761FC5
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jul 2023 19:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690304769;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/qVLO/qtnKO1EPcrXxzAXfRrit5xUD+2hcrlwWNtFCw=;
	b=DiGH28VFvsR8kax9oCNx2Rcp8NL0mXgIGhqGgRKssCmt+IRabri5HKpAhH+9SmVOkksB/t
	GdwbhrWXDcdEY3bAEL+p7smq41ocdbuxlFPSsCdMwAiAedoD7Mswk4Ep9V9PbaYdmutixv
	+j57r8GPDR61EuFeblDNXVNcGeBPT9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-vgS2DD97NQ6-mswg6V3a_w-1; Tue, 25 Jul 2023 13:06:07 -0400
X-MC-Unique: vgS2DD97NQ6-mswg6V3a_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A258C8030AC;
	Tue, 25 Jul 2023 17:06:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD58C2C7D3;
	Tue, 25 Jul 2023 17:05:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7413C1946A6D;
	Tue, 25 Jul 2023 17:05:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D21561946589 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 17:05:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9EF5AC2C856; Tue, 25 Jul 2023 17:05:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 701C6C2C7D3;
 Tue, 25 Jul 2023 17:05:52 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Samuel Bahr <sbahr@pinterest.com>
Subject: Re: Cannot disable kernel's audit system via auditctl
Date: Tue, 25 Jul 2023 13:05:51 -0400
Message-ID: <2241383.iZASKD2KPV@x2>
Organization: Red Hat
In-Reply-To: <CAG0SdGBHnFLf=DDMwvyYyctfq3YcA3RUzuEibMdDbxTCuwFxZA@mail.gmail.com>
References: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
 <2691760.mvXUDI8C0e@x2>
 <CAG0SdGBHnFLf=DDMwvyYyctfq3YcA3RUzuEibMdDbxTCuwFxZA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, July 24, 2023 5:06:02 PM EDT Samuel Bahr wrote:
> `auditctl -D` does not make it go away (outputs `No rules`). auditd isn't
> running at all and this behavior is happening purely from the kernel. These
> systems were never set to enabled 2 (locked).
> 
> I went ahead and filed a Github issue for this thread:
> https://github.com/linux-audit/audit-kernel/issues/146
> 
> The maintainer there suggested it's too difficult to debug due to eBPF
> programs + AWS's modified kernel.

I think there is data that could help decide where the problem might be. On 
one of the systems that is still logging, try running an event type report:

aureport --start yesterday --event --summary -i

This should identify what kind of event is being emitted. Based on that, it 
might point to where the problem is.

> I've resigned to asking Red Canary to support eBPF mode with `audit=0`
> kernel parameter in their Linux EDR. Let me know if you have any other
> ideas.

I'd say collecting summary information about what kind of events are being 
logged would be a good start.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

