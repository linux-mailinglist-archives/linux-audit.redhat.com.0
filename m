Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 988EE2E0F9
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 17:24:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D168BC065135;
	Wed, 29 May 2019 15:23:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB08D10027B6;
	Wed, 29 May 2019 15:23:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8580C1806B16;
	Wed, 29 May 2019 15:23:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TEwDLu023174 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 10:58:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1BC963BB8; Wed, 29 May 2019 14:58:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF14600C4
	for <linux-audit@redhat.com>; Wed, 29 May 2019 14:58:10 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6F0C30C1B96
	for <linux-audit@redhat.com>; Wed, 29 May 2019 14:57:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g9so1789213pfo.11
	for <linux-audit@redhat.com>; Wed, 29 May 2019 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho-ws.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sIAmsJEpBYAFITCiVn5ontRF8mPnuiYWYs/RXhqJVik=;
	b=WX7P/J1WgZ/D9lrZgOu1anQ6YIHb47wFUL+vzOPy5wp7tMGaB3GMXODl41EgHc8fmy
	O7CyTYBnpED9Ui08UL7+gG+G4ETtS6EPVbUOEwzGM3Gv+sMqOt9+eBigGG2ZScn8Gn+B
	mafYiq2WG7VzWLDTbnjHuyxYslOU/8LCyAkITg+lJDaaG8rsFUNzAf06z5HPQAwDuMnZ
	DDJCih2aBYGHvXSVQn3uSHbkEXIZIcuTm6aXFc7EHyMOA7oZW2kJ3aA+EKTvV+f/8kzR
	kd5R5mNQMOwiYz89vs7++vyO0bxo90i9bXogfTrnumYixYFV7p9mNBFBfwtXMp1IzGFS
	rm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sIAmsJEpBYAFITCiVn5ontRF8mPnuiYWYs/RXhqJVik=;
	b=HM0J/Rf30aPvU7bK4f2a8uBPzW5Vdh3ayEfxhXFSV/J6l+ZTLgpPKWyC92STNH//Ky
	J2wE7Mm6U8ciAS48UIjygGe40gHdzQgyJFai+zACRHtYZVfdXmsXQBGddOzMtuRc32gR
	4II4JuPKH4bLKhmqbShYm4Z1zJel4Qjuk1yW2xf6mrVT9Ex+3zJTo3vqvxd3TxGKngtW
	wwhMuaDn2cUUIGFhRQdQyaOUYwZ4IfWm6h/flmIJ4XKI4oyyJ8FYOLWSMAkPhZjqL4Gr
	VOOatVXFIycD7shfUi0Z+4gdSrNgG4iElMrfr/GLGh+u9aIWv6AzZnnvhcHnH6gV7YN0
	KSUQ==
X-Gm-Message-State: APjAAAURaIwjih/5Y2/LDuuBjmt2Gs9dqVOsVYlkX30V/6jlsTWXJvhp
	NZVryAHlOt+TOKWLU9PqmUtF2vKJJUs1ZQ==
X-Google-Smtp-Source: APXvYqxNaNP9e3ltFNMVhA0l1R837lO1f6xlta8mbDk8OLksP1OtAUD8KUF2OzYdBkOo9TcqAUPkQg==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr32442911pgi.32.1559141866858; 
	Wed, 29 May 2019 07:57:46 -0700 (PDT)
Received: from cisco ([2601:280:b:edbb:840:fa90:7243:7032])
	by smtp.gmail.com with ESMTPSA id
	t11sm15682423pgp.1.2019.05.29.07.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 07:57:46 -0700 (PDT)
Date: Wed, 29 May 2019 08:57:42 -0600
From: Tycho Andersen <tycho@tycho.ws>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190529145742.GA8959@cisco>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 14:57:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 14:57:52 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'tycho@tycho.ws' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <tycho@tycho.ws>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 May 2019 11:22:40 -0400
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, eparis@parisplace.org, serge@hallyn.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 29 May 2019 15:24:03 +0000 (UTC)

On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> It is not permitted to unset the audit container identifier.
> A child inherits its parent's audit container identifier.

...

>  /**
> + * audit_set_contid - set current task's audit contid
> + * @contid: contid value
> + *
> + * Returns 0 on success, -EPERM on permission failure.
> + *
> + * Called (set) from fs/proc/base.c::proc_contid_write().
> + */
> +int audit_set_contid(struct task_struct *task, u64 contid)
> +{
> +	u64 oldcontid;
> +	int rc = 0;
> +	struct audit_buffer *ab;
> +	uid_t uid;
> +	struct tty_struct *tty;
> +	char comm[sizeof(current->comm)];
> +
> +	task_lock(task);
> +	/* Can't set if audit disabled */
> +	if (!task->audit) {
> +		task_unlock(task);
> +		return -ENOPROTOOPT;
> +	}
> +	oldcontid = audit_get_contid(task);
> +	read_lock(&tasklist_lock);
> +	/* Don't allow the audit containerid to be unset */
> +	if (!audit_contid_valid(contid))
> +		rc = -EINVAL;
> +	/* if we don't have caps, reject */
> +	else if (!capable(CAP_AUDIT_CONTROL))
> +		rc = -EPERM;
> +	/* if task has children or is not single-threaded, deny */
> +	else if (!list_empty(&task->children))
> +		rc = -EBUSY;
> +	else if (!(thread_group_leader(task) && thread_group_empty(task)))
> +		rc = -EALREADY;
> +	read_unlock(&tasklist_lock);
> +	if (!rc)
> +		task->audit->contid = contid;
> +	task_unlock(task);
> +
> +	if (!audit_enabled)
> +		return rc;

...but it is allowed to change it (assuming
capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
immediately useful since we still live in the world of majority
privileged containers if we didn't allow changing it, in addition to
un-setting it.

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
