Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3081F1D1D
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 18:19:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591633161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2WJYyxbMRHS4DsVjUhPyb5g96xFTZKWrv3cUI3RId6o=;
	b=MpPU3Y/But8UxjAm5WxNqh1NnD/zdt6ZQt/ek524Xa8SZj3F5bQVlCLycgeIVmuvheKFih
	pSz7KI+9jArst5JuWWzBlnUfxRmpa17aeTum1e8Qc5IqxhH3/q81f5Fo70uOckQPUcaSgv
	2K+59rgMQLnYmeNmuMRBbNxMacvr3JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Tj4CeJ3PNES7MNekUSJicg-1; Mon, 08 Jun 2020 12:19:19 -0400
X-MC-Unique: Tj4CeJ3PNES7MNekUSJicg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112CF8C3963;
	Mon,  8 Jun 2020 16:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C4BC891E6;
	Mon,  8 Jun 2020 16:18:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4BB41809547;
	Mon,  8 Jun 2020 16:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058GIhnR014728 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:18:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DFDAB3026; Mon,  8 Jun 2020 16:18:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2438A4C9
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 16:18:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F442800677
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 16:18:41 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-453-ews9rWX4P9yZEn8ktdXxAQ-1; Mon, 08 Jun 2020 12:18:38 -0400
X-MC-Unique: ews9rWX4P9yZEn8ktdXxAQ-1
Received: by mail-oi1-f193.google.com with SMTP id k4so14268922oik.2
	for <linux-audit@redhat.com>; Mon, 08 Jun 2020 09:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hxgX8XRTZ/HnkW28Jox/7DYc5hEQI3C4tGBMR0OOhRA=;
	b=bPX7r5d8C5NeyfivVYeORAHWR+7rRuVH8lEmuZiC800NupsHvQ6uH7TVK2laaCIha4
	RGfdn9ptZ/uBLsIfS+fPRYXGNacaSA6kbOx5yimG3QCMrY5jFxNcsMSMbiKBheAAS/ug
	mEXlFabdchJilE68kus1ftXTBU2njuTA2v/9zSFamBei/C5ajWA+gIju15wwPbZe83P+
	tXzokVuyDP/NJ2I0ow3ukLQ43mmYz/JXvhk1UBn2HU/YPmRThu3s/ElEa95Sy8d+hUNp
	0Go2pFgqkxum2mU5Ss+dja5qjKo3fQR8YP470uhT9Pv1EGqTxTbHKTPwCxj3UaRDNL/3
	lnDQ==
X-Gm-Message-State: AOAM531+C0nlwaiQFi8O7y5EOn/uWGGutexCDtE+afOtplFu/DmqJW3D
	EZdxMTCOTHirb7NmKtQ29BPlLaz3Xrbe47KNQNoHzJjT
X-Google-Smtp-Source: ABdhPJwi3GfjWvAJDETIoOvqTUhdh+D3Wy4eqgzWPyGixX9AnhTdi7QjiaEMHRys1SQ3tSNW1otAY0mRJB1Kryven7k=
X-Received: by 2002:aca:ec97:: with SMTP id k145mr121248oih.92.1591633117782; 
	Mon, 08 Jun 2020 09:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200605081952.16278-1-toiwoton@gmail.com>
In-Reply-To: <20200605081952.16278-1-toiwoton@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 8 Jun 2020 12:18:26 -0400
Message-ID: <CAEjxPJ50YNJViUUA=7jaLwzPDMJUE0xzegAes4YF=TwpAo88YQ@mail.gmail.com>
Subject: Re: [PATCH v2] semanage: handle getprotobyname() failure case
To: Topi Miettinen <toiwoton@gmail.com>, linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 5, 2020 at 4:24 AM Topi Miettinen <toiwoton@gmail.com> wrote:
>
> At least on Debian, /etc/protocols, which is used by
> socket.getprotobyname() to resolve protocols to names, does not
> contain an entry for "ipv4". In that case, set the protocol number
> used by audit logs for "ipv4" to a fixed value. To ensure audit log
> compatibility, let's use the same numeric value as Fedora: 4, which is
> actually understood by kernel as IP over IP.
>
> Signed-off-by: Topi Miettinen <toiwoton@gmail.com>

This looks fine to me but adding linux-audit mailing list to see if
they have any concerns.  It appears to make no change to the audit
messages on Fedora.

> ---
> v2: don't change audit log format
> ---
>  python/semanage/seobject.py | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/python/semanage/seobject.py b/python/semanage/seobject.py
> index 6e0b87f2..6a14f7b4 100644
> --- a/python/semanage/seobject.py
> +++ b/python/semanage/seobject.py
> @@ -1870,10 +1870,22 @@ class nodeRecords(semanageRecords):
>          except:
>              raise ValueError(_("Unknown or missing protocol"))
>
> -        return newaddr, newmask, newprotocol
> +        try:
> +            audit_protocol = socket.getprotobyname(protocol)
> +        except:
> +            # Entry for "ipv4" not found in /etc/protocols on (at
> +            # least) Debian? To ensure audit log compatibility, let's
> +            # use the same numeric value as Fedora: 4, which is
> +            # actually understood by kernel as IP over IP.
> +            if (protocol == "ipv4"):
> +                audit_protocol = socket.IPPROTO_IPIP
> +            else:
> +                raise ValueError(_("Unknown or missing protocol"))
> +
> +        return newaddr, newmask, newprotocol, audit_protocol
>
>      def __add(self, addr, mask, proto, serange, ctype):
> -        addr, mask, proto = self.validate(addr, mask, proto)
> +        addr, mask, proto, audit_proto = self.validate(addr, mask, proto)
>
>          if is_mls_enabled == 1:
>              if serange == "":
> @@ -1942,7 +1954,7 @@ class nodeRecords(semanageRecords):
>          semanage_node_key_free(k)
>          semanage_node_free(node)
>
> -        self.mylog.log_change("resrc=node op=add laddr=%s netmask=%s proto=%s tcontext=%s:%s:%s:%s" % (addr, mask, socket.getprotobyname(self.protocol[proto]), "system_u", "object_r", ctype, serange))
> +        self.mylog.log_change("resrc=node op=add laddr=%s netmask=%s proto=%s tcontext=%s:%s:%s:%s" % (addr, mask, audit_proto, "system_u", "object_r", ctype, serange))
>
>      def add(self, addr, mask, proto, serange, ctype):
>          self.begin()
> @@ -1950,7 +1962,7 @@ class nodeRecords(semanageRecords):
>          self.commit()
>
>      def __modify(self, addr, mask, proto, serange, setype):
> -        addr, mask, proto = self.validate(addr, mask, proto)
> +        addr, mask, proto, audit_proto = self.validate(addr, mask, proto)
>
>          if serange == "" and setype == "":
>              raise ValueError(_("Requires setype or serange"))
> @@ -1987,7 +1999,7 @@ class nodeRecords(semanageRecords):
>          semanage_node_key_free(k)
>          semanage_node_free(node)
>
> -        self.mylog.log_change("resrc=node op=modify laddr=%s netmask=%s proto=%s tcontext=%s:%s:%s:%s" % (addr, mask, socket.getprotobyname(self.protocol[proto]), "system_u", "object_r", setype, serange))
> +        self.mylog.log_change("resrc=node op=modify laddr=%s netmask=%s proto=%s tcontext=%s:%s:%s:%s" % (addr, mask, audit_proto, "system_u", "object_r", setype, serange))
>
>      def modify(self, addr, mask, proto, serange, setype):
>          self.begin()
> @@ -1995,8 +2007,7 @@ class nodeRecords(semanageRecords):
>          self.commit()
>
>      def __delete(self, addr, mask, proto):
> -
> -        addr, mask, proto = self.validate(addr, mask, proto)
> +        addr, mask, proto, audit_proto = self.validate(addr, mask, proto)
>
>          (rc, k) = semanage_node_key_create(self.sh, addr, mask, proto)
>          if rc < 0:
> @@ -2020,7 +2031,7 @@ class nodeRecords(semanageRecords):
>
>          semanage_node_key_free(k)
>
> -        self.mylog.log_change("resrc=node op=delete laddr=%s netmask=%s proto=%s" % (addr, mask, socket.getprotobyname(self.protocol[proto])))
> +        self.mylog.log_change("resrc=node op=delete laddr=%s netmask=%s proto=%s" % (addr, mask, audit_proto))
>
>      def delete(self, addr, mask, proto):
>          self.begin()
> --
> 2.26.2
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

