Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 656907841D8
	for <lists+linux-audit@lfdr.de>; Tue, 22 Aug 2023 15:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692710359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zXjdJh3+IX0IpDxtpC2n6T2aXJ0uZmRPdtwSt0fXjGk=;
	b=PqUTRY2EmyKc8N6mL3Iu5VIbYKeQXQq4AGEOQ2e/389b0sFsFMs6ecg4NbvMrj56PwRsXo
	iYa5WBPRgEQt8BhEtl7FXbeGCFVAo1c8Zl7qxunI6n2HLIKrqjUd7/oy/ev/hnnclzVNrV
	G9t+wHPXoZERDCmdNNhHmdLke6y3RC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-5rRSRVpqMGicZZEalW7AyA-1; Tue, 22 Aug 2023 09:19:15 -0400
X-MC-Unique: 5rRSRVpqMGicZZEalW7AyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97C8E85CCE4;
	Tue, 22 Aug 2023 13:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEA382027003;
	Tue, 22 Aug 2023 13:19:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1EAE61946594;
	Tue, 22 Aug 2023 13:19:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B103B1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 16:14:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78FA9C15BB8; Mon, 21 Aug 2023 16:14:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 712E1C15BAE
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 16:14:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A40B85C70D
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 16:14:54 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-I0gvKZI1O5yeYM2K2wu3iw-1; Mon,
 21 Aug 2023 12:14:52 -0400
X-MC-Unique: I0gvKZI1O5yeYM2K2wu3iw-1
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 4E1F0A29; Mon, 21 Aug 2023 11:04:46 -0500 (CDT)
Date: Mon, 21 Aug 2023 11:04:46 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: [PATCH] audit: add task history record
Message-ID: <20230821160446.GA1317178@mail.hallyn.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
In-Reply-To: <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 22 Aug 2023 13:18:53 +0000
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hallyn.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 19, 2023 at 04:09:46PM +0900, Tetsuo Handa wrote:
> Anyway, enabling TOMOYO in Fedora/RHEL kernels won't solve the problem
> this patch is trying to solve, for TOMOYO cannot utilize TOMOYO's process
> history information because LSM hook for sending signals does not allow
> TOMOYO to sleep...

Hang on a tick - I think perhaps you should have led with this.  The
main argument against this has been (iiuc) that it is a subset of
tomoyo functionality.  In that case, I'm on the fence about whether it
should be included.

But here you say that tomoyo cannot do this.  If that's the case, and
this is simply completely new functionality, that changes things.

-serge

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

