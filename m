Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B56836CB
	for <lists+linux-audit@lfdr.de>; Tue, 31 Jan 2023 20:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675194461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mkhzOXIh0yIretd0FtH5DlAg5ndopR6sbJq48lPeUpQ=;
	b=JiFh6TKd7D/1H5YV1aPHjAURfb8WZlQfb5p0L8L7akRRnbKjANBVo5dXMPXop8ahSwQKU5
	DmP4VI6Z/9d5FYNWXu3VYjxY8ZY7E6j4CiJMdpriDWS1mY4aTPVfBDqrQoF5TYs0txW+aU
	9hOzL8BFwCkyHJ1pruDAj8ytwSSeNdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-QWcPdoT-P4abBZ4t9_qb-Q-1; Tue, 31 Jan 2023 14:47:38 -0500
X-MC-Unique: QWcPdoT-P4abBZ4t9_qb-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B54487B2A3;
	Tue, 31 Jan 2023 19:47:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 847EFC15BAE;
	Tue, 31 Jan 2023 19:47:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 69C0C19465A2;
	Tue, 31 Jan 2023 19:47:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A96F1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 19:44:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06A10175A2; Tue, 31 Jan 2023 19:44:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E3043FB3
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 19:44:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3A99101A52E
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 19:44:38 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-W_c3UE2CMYmkVk0MY9aB3w-1; Tue, 31 Jan 2023 14:44:37 -0500
X-MC-Unique: W_c3UE2CMYmkVk0MY9aB3w-1
Received: by mail-pj1-f48.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so15485150pjb.5
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 11:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7xM9SZ9rvSBP3fdkG0BZuBmu7CtX9l0AI0Bu8tXGl8=;
 b=1uV/t8AmVRmDWkq/HLkF2AMmoG9C20LowXWdFbSeq/yQmkHiAFo9COc70BlLtR0CrX
 uY+vb818v+MDQowXkqEkTb1bgsjR6bWTIpgTesZywlIFRjsEOJ8rz5eSSj8rKr6Re3jb
 B5enoZ1Gmcb8Bd9bvE+ProgyiXdk3MGyVojBm76fF3JaxzbE2+AkkhWBtxTLoW4nOUEU
 4zfORmdcM01A9s8Fi9cfZSkMQOGpa7i1PO8g2zOVkKz5h+HpBzhyt4YxStK3K0L6jJ3F
 1tdJESE+oUk1nXWg9Vo/w+r0ZnP6gVkgmvf4lpLLRUegzu3ff4HcK1ReXku5rFmV7yE5
 A8pQ==
X-Gm-Message-State: AO0yUKXhJOnvJq96/fOVgikdJrkKOwka1+7gRS0YXUiDRSH0k2mh6JhC
 2eC/rQavlnPwJKXoxHVXICuhIdAi97eirvDu1KWsMM9aHDHI
X-Google-Smtp-Source: AK7set9knbwtDWbbylVWIxLaJ2pjuGKGalAK3LsLD8u2n3o3muZjicyYcvIOaTIVLlrMn9j+lkyGZsJ/z+7J6CIRHnk=
X-Received: by 2002:a17:903:2484:b0:193:e89:f610 with SMTP id
 p4-20020a170903248400b001930e89f610mr7284plw.31.1675194275590; Tue, 31 Jan
 2023 11:44:35 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 31 Jan 2023 14:44:23 -0500
Message-ID: <CAHC9VhRM16vx4S+2FUcRftvt+DcPe_zASkAyAS4BSzBMFH=pog@mail.gmail.com>
Subject: Upstream kernel development and the linux-audit mailing list
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

Those of you who have been following the linux-audit mailing list
closely over the past several years have likely seen some issues
relating to upstream Linux Kernel development and the mailing list:
disagreements on the focus of the list (upstream vs upstream+distro),
and a moderated vs open posting policy.

In general the disagreements around the focus of the list, while
annoying at times, tended not to be significant issues.
Unfortunately, the issue of list moderation has been a problem with
other subsystem maintainers and developers dropping the audit list
from their discussions due to the moderation settings.  While I had
hoped that we might change the list to an open list, just like most of
the upstream kernel mailing lists, Steve has mentioned that he does
not want to make the change due to concerns over SPAM.

With that in mind, I'm going to suggest moving the development of
audit in the upstream Linux Kernel to a new mailing list hosted on
vger.kernel.org.  Many of you who participate, or at least monitor,
kernel development are no doubt already subscribed to at least one
mailing list hosted on vger as it is one of the most common (*the*
most common?) list host for Linux Kernel related development.

I don't want to make any statements with respect to Steve's audit
userspace, that is up to him, but I don't have any problem if he wants
to move upstream discussion of his audit userspace tools to the same
vger-based list.

I'll hold off on list creation for a couple of days in case anyone has
a well reasoned argument against moving upstream kernel development to
a new list.  However, I want to underscore that any argument to keep
upstream discussions on a moderated list will need to be strong enough
to counter potentially excluding other subsystems from the discussion.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

