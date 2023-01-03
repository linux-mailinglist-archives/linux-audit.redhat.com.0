Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0B65D50B
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XD+DQcHlY80/ZDZXep2fxQ93iCkJ7oLhvSL4JTj26LY=;
	b=gHLkkvcdfytaHMj+YQul91oTzVzeEANnYfhvfOAoHixhi8fe4p3zAOZFM9G7PArw49+NrM
	IiAUJfx8f9+ktzFt1u3/wxCiGmyVnwLHAJsF/gO0WA7njeppAm+V3lawkt2C38jyuM1iul
	Ay7PRcfYD3Z5PMsXPWX3UIWuv0iple0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-bEHcncC0OXaSWFngYORCkw-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: bEHcncC0OXaSWFngYORCkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3132802E22;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1EB14171B6;
	Wed,  4 Jan 2023 14:07:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 740141947074;
	Wed,  4 Jan 2023 14:07:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C9621946587 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 22:59:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 516341121315; Tue,  3 Jan 2023 22:59:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4880E1121314
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 22:59:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1774C29AA2C5
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 22:59:30 +0000 (UTC)
Received: from out03.mta.xmission.com (out03.mta.xmission.com
 [166.70.13.233]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-cJ4yy5kCP1GihvdOom3g4g-1; Tue, 03 Jan 2023 17:59:28 -0500
X-MC-Unique: cJ4yy5kCP1GihvdOom3g4g-1
Received: from in01.mta.xmission.com ([166.70.13.51]:35338)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pCox2-00DQGM-KE; Tue, 03 Jan 2023 14:36:04 -0700
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:38124
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1pCox1-009hFk-GF; Tue, 03 Jan 2023 14:36:04 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Yann Sionneau <ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <20230103164359.24347-3-ysionneau@kalray.eu>
Date: Tue, 03 Jan 2023 15:35:28 -0600
In-Reply-To: <20230103164359.24347-3-ysionneau@kalray.eu> (Yann Sionneau's
 message of "Tue, 3 Jan 2023 17:43:36 +0100")
Message-ID: <875ydnmhcv.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1pCox1-009hFk-GF; ; ;
 mid=<875ydnmhcv.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18zTivb3taYGRDictjAGoI8aGmfYtFodes=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,LotsOfNums_01,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 XMNoVowels shortcircuit=no autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 *  1.2 LotsOfNums_01 BODY: Lots of long strings of numbers
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: **;Yann Sionneau <ysionneau@kalray.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 564 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (2.0%), b_tie_ro: 10 (1.7%), parse: 0.91
 (0.2%), extract_message_metadata: 31 (5.5%), get_uri_detail_list: 2.6
 (0.5%), tests_pri_-2000: 35 (6.1%), tests_pri_-1000: 2.5 (0.4%),
 tests_pri_-950: 1.28 (0.2%), tests_pri_-900: 1.05 (0.2%),
 tests_pri_-200: 0.89 (0.2%), tests_pri_-100: 15 (2.6%), tests_pri_-90:
 93 (16.4%), check_bayes: 80 (14.2%), b_tokenize: 10 (1.7%),
 b_tok_get_all: 10 (1.8%), b_comp_prob: 2.7 (0.5%), b_tok_touch_all: 54
 (9.6%), b_finish: 0.99 (0.2%), tests_pri_0: 346 (61.4%),
 check_dkim_signature: 0.55 (0.1%), check_dkim_adsp: 14 (2.6%),
 poll_dns_idle: 1.02 (0.2%), tests_pri_10: 3.2 (0.6%), tests_pri_500:
 20 (3.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [RFC PATCH 02/25] kvx: Add ELF-related definitions
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
Cc: linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-mm@kvack.org, linux-audit@redhat.com,
 Clement Leger <clement.leger@bootlin.com>, Kees Cook <keescook@chromium.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yann Sionneau <ysionneau@kalray.eu> writes:

> Add ELF-related definitions for kvx, including: EM_KVX,
> AUDIT_ARCH_KVX and NT_KVX_TCA.

Has someone written an SYSVABI architecture specification for
your architecture?

I feel uncomfortable with the linux-kernel headers being the
authoritative place for the ELF abi definitions.

Especially since the linux kernel does not deal with relocations,
and the kernel headers could diverge from the real world and no one
would notice..

I know at least at one point the linux standards base was taking
up the work on collecting up some of these definitions.  I would
be happy if there was anything outside of the linux kernel that
people could refer too.

Eric

> CC: Paul Moore <paul@paul-moore.com>
> CC: Eric Paris <eparis@redhat.com>
> CC: Eric Biederman <ebiederm@xmission.com>
> CC: Kees Cook <keescook@chromium.org>
> CC: linux-audit@redhat.com
> CC: linux-kernel@vger.kernel.org
> CC: linux-mm@kvack.org
> Co-developed-by: Clement Leger <clement.leger@bootlin.com>
> Signed-off-by: Clement Leger <clement.leger@bootlin.com>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>  include/uapi/linux/audit.h  | 1 +
>  include/uapi/linux/elf-em.h | 1 +
>  include/uapi/linux/elf.h    | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index d676ed2b246e..4db7aa3f84c7 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -402,6 +402,7 @@ enum {
>  #define AUDIT_ARCH_HEXAGON	(EM_HEXAGON)
>  #define AUDIT_ARCH_I386		(EM_386|__AUDIT_ARCH_LE)
>  #define AUDIT_ARCH_IA64		(EM_IA_64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_KVX		(EM_KVX|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>  #define AUDIT_ARCH_M32R		(EM_M32R)
>  #define AUDIT_ARCH_M68K		(EM_68K)
>  #define AUDIT_ARCH_MICROBLAZE	(EM_MICROBLAZE)
> diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> index ef38c2bc5ab7..9cc348be7f86 100644
> --- a/include/uapi/linux/elf-em.h
> +++ b/include/uapi/linux/elf-em.h
> @@ -51,6 +51,7 @@
>  #define EM_RISCV	243	/* RISC-V */
>  #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
>  #define EM_CSKY		252	/* C-SKY */
> +#define EM_KVX		256	/* Kalray VLIW Architecture */
>  #define EM_LOONGARCH	258	/* LoongArch */
>  #define EM_FRV		0x5441	/* Fujitsu FR-V */
>  
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index c7b056af9ef0..49094f3be06c 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -444,6 +444,7 @@ typedef struct elf64_shdr {
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
>  #define NT_LOONGARCH_LASX	0xa03	/* LoongArch Loongson Advanced SIMD Extension registers */
>  #define NT_LOONGARCH_LBT	0xa04	/* LoongArch Loongson Binary Translation registers */
> +#define NT_KVX_TCA		0x900	/* kvx TCA registers */
>  
>  /* Note types with note name "GNU" */
>  #define NT_GNU_PROPERTY_TYPE_0	5

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

