Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DEFC4214D92
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:12:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-sjKwfNNUNa2K4x7nJDx0sg-1; Sun, 05 Jul 2020 11:12:25 -0400
X-MC-Unique: sjKwfNNUNa2K4x7nJDx0sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A467186A232;
	Sun,  5 Jul 2020 15:12:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39ACA5C1D4;
	Sun,  5 Jul 2020 15:12:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DF831809547;
	Sun,  5 Jul 2020 15:12:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FCBDg029229 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:12:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C00802156A4C; Sun,  5 Jul 2020 15:12:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 667C82166B27
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:12:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DE61186E3AE
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:12:04 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-RzR1V8r4NFG3_2rdwJb3QA-1; Sun, 05 Jul 2020 11:12:00 -0400
X-MC-Unique: RzR1V8r4NFG3_2rdwJb3QA-1
Received: by mail-ej1-f67.google.com with SMTP id dr13so39777107ejc.3
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BI1aAShmO7FXnwtN8B6Od+9nVsaMtVkeWnOGj2Zvm4Y=;
	b=QpIsoe7PiMpOHuo9BdwFgsImVIfSzAXbH4xNu+DsvvkMXBfHw3iaWb2SW0stF8n/U5
	oCeLWYtVrj9tmmf6yXYp4zKNHik77gdvLkHbug4dW7WP/Ke+vsvNMMi5bT543hhcx4sM
	2FA5tHJCtr0c7cp+8RwxV7dENtsQGtXOsARpMnolAFePCctSEswEb3UGo4dse9u2ucHM
	t3zjW73eqgAdGy1m1SXaZrPy1NQCWH8x9IKFgSiZfMFTXHqF3Rd0h21o9KUZ4sqz/AVQ
	55xnz3n1hlQx7qbnVjMF8Jg29C/liBJ3XPVJ6LNkDNggJ0qWv/x+h4ksD5XO1XUsA49y
	4k7Q==
X-Gm-Message-State: AOAM531qigVG/3BSRbobMm7HkhBoxpa1sNZSIHuYyzb36lPpxpUE3Vv7
	6JRAmpLDI4++4AzGzWX9PeBntwVGMQQ+FDgTvC0k
X-Google-Smtp-Source: ABdhPJy+1+ndZZah7VkLTSj7twGu3m1RKvwdW+PIAE3WsheefQt0o8KCRqSrelgLi4drC0Gf6mOHLfy4/pYyZRxzQXY=
X-Received: by 2002:a17:906:1a59:: with SMTP id
	j25mr37962178ejf.398.1593961918982; 
	Sun, 05 Jul 2020 08:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<b6cb5500cfd7e8686ac2a7758103688c2da7f4ce.1593198710.git.rgb@redhat.com>
In-Reply-To: <b6cb5500cfd7e8686ac2a7758103688c2da7f4ce.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:47 -0400
Message-ID: <CAHC9VhRvuu-_+gh9ejr0sFDNR6erV2BAig6qrT9gOEB6GczXvw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 13/13] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:24 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> process in a non-init user namespace the capability to set audit
> container identifiers of individual children.
>
> Provide the /proc/$PID/audit_capcontid interface to capcontid.
> Valid values are: 1==enabled, 0==disabled
>
> Writing a "1" to this special file for the target process $PID will
> enable the target process to set audit container identifiers of its
> descendants.
>
> A process must already have CAP_AUDIT_CONTROL in the initial user
> namespace or have had audit_capcontid enabled by a previous use of this
> feature by its parent on this process in order to be able to enable it
> for another process.  The target process must be a descendant of the
> calling process.
>
> Report this action in new message type AUDIT_SET_CAPCONTID 1022 with
> fields opid= capcontid= old-capcontid=
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/proc/base.c             | 57 +++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/audit.h      | 14 ++++++++++++
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 38 ++++++++++++++++++++++++++++++-
>  4 files changed, 108 insertions(+), 2 deletions(-)

This seems very similar to the capable/ns_capable combination I
mentioned in patch 11/13; any reasons why you feel that this might be
a better approach?  My current thinking is that the capable/ns_capable
approach is preferable as it leverages existing kernel mechanisms and
doesn't require us to reinvent the wheel in the audit subsystem.


--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

