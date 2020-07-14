Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7514E21F726
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 18:22:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-mAPF8f2SMgGUySKJr2PdJg-1; Tue, 14 Jul 2020 12:22:29 -0400
X-MC-Unique: mAPF8f2SMgGUySKJr2PdJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43A7D8014D4;
	Tue, 14 Jul 2020 16:22:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFD560C84;
	Tue, 14 Jul 2020 16:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0A7794F06;
	Tue, 14 Jul 2020 16:22:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EGM4JO012740 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 12:22:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E537B215ADC9; Tue, 14 Jul 2020 16:22:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF512215ADC4
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 16:22:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A59B11832D21
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 16:22:01 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-o0YAbW96O7-odaUpffcV7Q-1; Tue, 14 Jul 2020 12:21:58 -0400
X-MC-Unique: o0YAbW96O7-odaUpffcV7Q-1
Received: by mail-ej1-f67.google.com with SMTP id rk21so22724036ejb.2
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 09:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ACm5zpgMUDOifP2JDPj0YWtTUIFVz5vD9URrggO/mAA=;
	b=t2LlZ1mHM4mOSOAgKDxsZVuk0+IHPz/16EJm5BdbIyT2p4zfE+ngb3fcecH1BhsD7s
	fV39ZOdKjAJuAgtjn+gyfhbq4KRv7C4t/zxNdC8LZ5plDqX71cQn5yLA5Jjs+3UJfAPE
	SaH1Syc0peTD0cdeyeUPYeg7kvKK8aQoGr7Et/yr20lv20oQ7fnrkX5Gph9n6YznhxE6
	FY4xH6vfBJLWOXRYDUF7DCB2fYjnGUrH+g/j6Wbh7x3WsLoEUOnoF8i1yu4HeoS26Zju
	cSeWYKPJ1apxTGzYlWHJoPP8Axt0ThFzSihcM3/DKFIVmoWvcR17gFaYHHI3c1PGWzao
	S/og==
X-Gm-Message-State: AOAM531ioC6JK4OdqG+cMTwO+AUEYO4o3ipo4UjrX4RllvoQGl8xxxIl
	YBr+dVUml1EaQ5R/GY5lj1YZXUDzxOtOFmQpoUpTD4s=
X-Google-Smtp-Source: ABdhPJyF6gpCpooG9QJjzj45KHVvXALrktCkoyIJGGuND4vN4jg0OZvYslVqhQCNb/qWnHLybg6pA6hj4UKYnvztKaY=
X-Received: by 2002:a17:906:7d86:: with SMTP id
	v6mr5122113ejo.542.1594743716975; 
	Tue, 14 Jul 2020 09:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
In-Reply-To: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Jul 2020 12:21:45 -0400
Message-ID: <CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
Subject: Re: [PATCH ghak84 v4] audit: purge audit_log_string from the
	intra-kernel audit API
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, john.johansen@canonical.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> audit_log_string() was inteded to be an internal audit function and
> since there are only two internal uses, remove them.  Purge all external
> uses of it by restructuring code to use an existing audit_log_format()
> or using audit_log_format().
>
> Please see the upstream issue
> https://github.com/linux-audit/audit-kernel/issues/84
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
> Changelog:
> v4
> - use double quotes in all replaced audit_log_string() calls
>
> v3
> - fix two warning: non-void function does not return a value in all control paths
>         Reported-by: kernel test robot <lkp@intel.com>
>
> v2
> - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
>
> v1 Vlad Dronov
> - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
>
>  include/linux/audit.h     |  5 -----
>  kernel/audit.c            |  4 ++--
>  security/apparmor/audit.c | 10 ++++------
>  security/apparmor/file.c  | 25 +++++++------------------
>  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
>  security/apparmor/net.c   | 14 ++++++++------
>  security/lsm_audit.c      |  4 ++--
>  7 files changed, 46 insertions(+), 62 deletions(-)

Thanks for restoring the quotes, just one question below ...

> diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> index 4ecedffbdd33..fe36d112aad9 100644
> --- a/security/apparmor/ipc.c
> +++ b/security/apparmor/ipc.c
> @@ -20,25 +20,23 @@
>
>  /**
>   * audit_ptrace_mask - convert mask to permission string
> - * @buffer: buffer to write string to (NOT NULL)
>   * @mask: permission mask to convert
> + *
> + * Returns: pointer to static string
>   */
> -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> +static const char *audit_ptrace_mask(u32 mask)
>  {
>         switch (mask) {
>         case MAY_READ:
> -               audit_log_string(ab, "read");
> -               break;
> +               return "read";
>         case MAY_WRITE:
> -               audit_log_string(ab, "trace");
> -               break;
> +               return "trace";
>         case AA_MAY_BE_READ:
> -               audit_log_string(ab, "readby");
> -               break;
> +               return "readby";
>         case AA_MAY_BE_TRACED:
> -               audit_log_string(ab, "tracedby");
> -               break;
> +               return "tracedby";
>         }
> +       return "";

Are we okay with this returning an empty string ("") in this case?
Should it be a question mark ("?")?

My guess is that userspace parsing should be okay since it still has
quotes, I'm just not sure if we wanted to use a question mark as we do
in other cases where the field value is empty/unknown.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

