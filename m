Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4E6B45B3
	for <lists+linux-audit@lfdr.de>; Fri, 10 Mar 2023 15:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678458981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yZCyPV/3US93WzPzUwJn7fwL1e/uFIBERzbFl7bV+ic=;
	b=hMmGJcyfvvuK+ikztkaKtslmSm9/7blgdpCIMV9ws86ehDCbdk98dntqY0/HJXJYtpKETD
	Nmk+FZog2rFlUiMVJD3xBv2C2u3UJnldZGn2fpqBHcmbG/YPX2PBxJh2vLnzbQ7CHXCVxC
	YNlSCXpz31XtOBiP/HRKxmUlydip+ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-LzA9iykcOjWiOwWMmpFkmQ-1; Fri, 10 Mar 2023 09:36:18 -0500
X-MC-Unique: LzA9iykcOjWiOwWMmpFkmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA8F85CBE6;
	Fri, 10 Mar 2023 14:36:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66785440D8;
	Fri, 10 Mar 2023 14:36:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C50111946A63;
	Fri, 10 Mar 2023 14:36:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC2161946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 14:36:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A9FE3C15BAD; Fri, 10 Mar 2023 14:36:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.8.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F1C9C15BA0;
 Fri, 10 Mar 2023 14:36:01 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Bruce Elrick <bruce.elrick@canonical.com>
Subject: Re: Auditing nftables changes
Date: Fri, 10 Mar 2023 09:36:00 -0500
Message-ID: <4470524.LvFx2qVVIh@x2>
Organization: Red Hat
In-Reply-To: <CAH6unQJgo93VMKHUF7_LtjWu=L8yMEXfhGx6xHSDkATwG-SL=A@mail.gmail.com>
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
 <ZApM8u7iq7mDsdLW@madcap2.tricolour.ca>
 <CAH6unQJgo93VMKHUF7_LtjWu=L8yMEXfhGx6xHSDkATwG-SL=A@mail.gmail.com>
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
Cc: Richard Guy Briggs <rgb@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, March 9, 2023 5:52:28 PM EST Bruce Elrick wrote:
> Anyway, I think I need to spend some time playing until that "aha!"
> moment comes. It's feels a lot closer thanks to both of your responses
> and I really apprecaite the time you've taken to read my emails and
> respond to them.

There are simple events which are one line and compound events which are 
multiple lines - called records. The simple events tend to be hardwired and 
not optional. For example, logins are hardwired; kernel config changes are 
hardwired; authentication is hardwired.

The compound events tend to be related to audit rules (but not always). When 
the rule triggers, the syscall triggering the recording travels around 
different parts of the kernel. As it does so, there is code that observes and 
records different attributes of what it's doing. It may record the path, the 
socket, the command line, arguments of the syscall, etc. Then when the 
syscall finishes, the different observations are lumped together with the same 
serial number and output to the audit daemon.

The events originating from a rule can optionally have a key. This is to 
allow grouping of multiple rules that meet the same requirement. Simple 
events never have a key.

There are a couple presentations here that may help understand the audit 
system:
https://people.redhat.com/sgrubb/audit/

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

