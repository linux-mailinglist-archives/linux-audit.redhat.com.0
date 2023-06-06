Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5509724C8D
	for <lists+linux-audit@lfdr.de>; Tue,  6 Jun 2023 21:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686078545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9t+IbNlS4g540UNQ6/7+6WbegR3cfeUQt6dk+E1O6to=;
	b=c5jdg+bS7CHt6xw7fwe2N29Iv/HfpEOJI7QV6HIeffU7g93G55lWgG/cX2UJ4MXwei0KrG
	dAp61BX/qCCdALevbf1eoCMFTUKavjq4Xb6FvLXD14NgkHZUFGrmEx5k9F2M57CpSmztBs
	QHvPXwgrDVqvEZw9HIx9kOiDcEwKZjk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-hmvkhvgrMS2IGPDQZ16mTg-1; Tue, 06 Jun 2023 15:09:00 -0400
X-MC-Unique: hmvkhvgrMS2IGPDQZ16mTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A923802AF0;
	Tue,  6 Jun 2023 19:08:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83C0D9E8B;
	Tue,  6 Jun 2023 19:08:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9467319452C4;
	Tue,  6 Jun 2023 19:08:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B988E19465BD for <linux-audit@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 19:08:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1B44140E958; Tue,  6 Jun 2023 19:08:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEBA140E954;
 Tue,  6 Jun 2023 19:08:48 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
Date: Tue, 06 Jun 2023 15:08:47 -0400
Message-ID: <10292049.nUPlyArG6x@x2>
Organization: Red Hat
In-Reply-To: <CAMKmEH_hfOO_9a=QmUC9dQezA_hn0Kj-78hsK5GpXFbNXx2G_w@mail.gmail.com>
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
 <ZH5VgjpTytqaj5i5@madcap2.tricolour.ca>
 <CAMKmEH_hfOO_9a=QmUC9dQezA_hn0Kj-78hsK5GpXFbNXx2G_w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Vincent Abraham <vincent.ahm@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, June 6, 2023 6:31:55 PM EDT Vincent Abraham wrote:
> Thanks. Could you also point to portions in the codebase where these
> functions are called for monitoring file access?

I'll let Richard or Paul point to the place in the kernel if that's 
necessary. I think there's a fundamental mismatch and it might not matter.

> The reason I'm asking for this is that I'm trying to provide auditing for
> files of a specific type and I'm trying to understand how would that work.

The way the audit system works is there is a rule engine in the kernel. User 
space loads the rules and and listens for events. The kernel does all the 
work. This rule matching can be done by a limited set of attributes which for 
a file would be path, kind of access, who is accessing it, program accessing 
it, portions of se linux labeling, and a few other things.

You cannot match by type or anything that looks like a glob. You can arrange 
them in a directory and watch the whole directory. You can create a script 
that looks for files of a certain type and load rules specifically for them 
into the kernel (with a specific key so you can find them later). Or you can 
plug into auditd as a plugin and filter the events and write them to your own 
log.

There might be some other approaches such as using fanotify and filtering 
those events yourself.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

